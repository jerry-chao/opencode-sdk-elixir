defmodule Mix.Tasks.Opencode.Gen.Client do
  @moduledoc """
  Generates Elixir client code from the OpenCode v2 OpenAPI specification.

  This task:
  1. Obtains the OpenAPI spec (a local `--spec` file, the published v2 spec, or
     a running server's `/openapi.json`)
  2. Generates Elixir client code using oapi_generator

  > #### Spec source {: .warning}
  >
  > The default source is `https://opencode.ai/v2/openapi.json`. Override it
  > with the `OPENCODE_V2_SPEC_URL` environment variable.
  >
  > The v1 `opencode dev generate` CLI subcommand no longer exists in OpenCode
  > v2, and the v1 spec is still served at `https://opencode.ai/openapi.json`.
  > Point this task at `/v2/openapi.json`, not `/openapi.json`.

  ## Usage

      mix opencode.gen.client

  ## Options

      --spec PATH          Path to a local OpenAPI spec JSON file (optional)
      --from-server URL     Fetch the spec from a running server's
                            `/openapi.json` instead of downloading it
      --server-username U  Basic auth username for `--from-server`
      --server-password P  Basic auth password for `--from-server`

  ## Examples

      # Download the published v2 spec and generate
      mix opencode.gen.client

      # Generate from a local spec file
      mix opencode.gen.client --spec priv/opencode_openapi.json

      # Generate from a locally running server (v2 requires auth)
      mix opencode.gen.client --from-server http://127.0.0.1:4096 \\
        --server-username opencode --server-password "$OPENCODE_SERVER_PASSWORD"

  """

  use Mix.Task

  @spec_file "priv/opencode_openapi.json"
  @generated_dir "lib/opencode/generated"
  @default_spec_url "https://opencode.ai/v2/openapi.json"

  @impl Mix.Task
  def run(args) do
    {opts, _, _} =
      OptionParser.parse(args,
        switches: [
          spec: :string,
          from_server: :string,
          server_username: :string,
          server_password: :string
        ],
        aliases: [s: :spec]
      )

    spec_path = resolve_spec(opts)

    unless File.exists?(spec_path) do
      Mix.raise("""
      OpenAPI spec not found at: #{spec_path}

      Please either:
      1. Run: mix opencode.gen.client
      2. Provide a local spec file: mix opencode.gen.client --spec path/to/spec.json
      """)
    end

    Mix.shell().info("🔧 Generating OpenCode client from: #{spec_path}")
    Mix.shell().info("")

    # Run the OpenAPI generator using the opencode profile
    Mix.Task.run("api.gen", ["opencode", spec_path])

    # oapi_generator can omit @type definitions for nested typed maps whose
    # schemas are merged from multiple anyOf variants (they only appear as
    # `__fields__` clauses, which causes a compile error). Inject the missing
    # types so the generated code always compiles.
    fix_missing_types()

    Mix.shell().info("")
    Mix.shell().info("✅ Client generation complete!")
    Mix.shell().info("")
    Mix.shell().info("Generated files in: lib/opencode/generated/")
    Mix.shell().info("")
    Mix.shell().info("Next steps:")
    Mix.shell().info("  1. Review the generated code")
    Mix.shell().info("  2. Run: mix compile")
    Mix.shell().info("  3. Update your code to use the new client module")

    :ok
  end

  defp fix_missing_types do
    @generated_dir
    |> Path.join("*.ex")
    |> Path.wildcard()
    |> Enum.each(&fix_missing_types(&1))
  end

  defp fix_missing_types(path) do
    source = File.read!(path)

    case Code.string_to_quoted(source, escape: false) do
      {:ok, ast} ->
        {type_names, field_names, bodies} = collect_types(ast)

        case Enum.sort(field_names -- type_names) do
          [] ->
            :ok

          missing ->
            new_source =
              Enum.reduce(missing, source, fn name, acc ->
                inject_type(acc, name, Map.fetch!(bodies, name))
              end)

            if new_source == source do
              Mix.shell().error("⚠️ Could not locate `__fields__` for #{inspect(missing)} in #{path}")
            else
              File.write!(path, new_source)
              Mix.shell().info("✨ Injected #{length(missing)} missing @type(s) into #{path}")
            end
        end

      {:error, error} ->
        Mix.shell().error("⚠️ Could not parse #{path} during typespec fixup: #{Exception.message(error)}")
    end
  end

  defp collect_types(ast) do
    {_ast, {types, fields, bodies}} =
      Macro.prewalk(ast, {[], [], %{}}, fn
        {:@, _, [{:type, _, [{:"::", _, [{name, _, nil}, _]}]}]} = node, {types, fields, bodies}
        when is_atom(name) ->
          {node, {[name | types], fields, bodies}}

        {:def, _, [{:__fields__, _, [name]}, body]} = node, {types, fields, bodies}
        when is_atom(name) ->
          {node, {types, [name | fields], Map.put(bodies, name, extract_fields(body))}}

        node, acc ->
          {node, acc}
      end)

    {types, fields, bodies}
  end

  defp extract_fields([{:do, body}]), do: extract_fields(body)
  defp extract_fields({:__block__, _, [{:"[]", _, fields}]}), do: fields
  defp extract_fields({:"[]", _, fields}), do: fields
  defp extract_fields(fields) when is_list(fields), do: fields
  defp extract_fields(_), do: []

  defp inject_type(source, name, fields) do
    block = render_type_block(name, fields)
    def_line = "  def __fields__(:#{name}) do"

    String.replace(source, def_line, block <> "\n" <> def_line, global: false)
  end

  defp render_type_block(name, fields) do
    body =
      fields
      |> Enum.map(&render_field/1)
      |> Enum.join(",\n")
      |> String.split("\n")
      |> Enum.join("\n          ")

    """
      @type #{name} :: %{
              #{body}
            }
    """
  end

  defp render_field({field, value}) when is_atom(field) do
    key =
      if String.match?(Atom.to_string(field), ~r/^[a-zA-Z_][a-zA-Z0-9_]*[?!]?$/) do
        Atom.to_string(field)
      else
        inspect(field)
      end

    "#{key}: #{render_type(value)}"
  end

  defp render_field({field, value}) when is_binary(field) do
    "#{inspect(field)}: #{render_type(value)}"
  end

  defp render_type(value) do
    # oapi_generator is a dev/test-only dependency, so this file must compile
    # without it. `struct/2` and `apply/3` only reference the generator at
    # runtime, which is safe because generation always runs with it loaded.
    state = struct(OpenAPI.Renderer.State, implementation: OpenAPI.Renderer)

    state
    |> then(&apply(OpenAPI.Renderer.Util, :to_type, [&1, value]))
    |> Macro.to_string()
  rescue
    _ -> "map"
  end

  @doc false
  def resolve_spec(opts) do
    cond do
      spec = opts[:spec] ->
        Mix.shell().info("📄 Using local spec: #{spec}")
        spec

      server = opts[:from_server] ->
        fetch_spec_from_server(server, opts[:server_username], opts[:server_password])

      true ->
        fetch_published_spec()
    end
  end

  # OpenCode v2 removed the `opencode dev generate` subcommand, so the CLI is no
  # longer a spec source. The published v2 spec is.
  defp fetch_published_spec do
    url = System.get_env("OPENCODE_V2_SPEC_URL", @default_spec_url)
    Mix.shell().info("🌐 Downloading OpenAPI spec from #{url}")
    download_spec(url, nil, nil)
  end

  # A running v2 server serves its spec at `/openapi.json` (NOT
  # `/api/openapi.json`, which 404s) and requires Basic auth. Note that this
  # endpoint reflects only the instance's loaded surface, so it can be a strict
  # subset of the published spec.
  defp fetch_spec_from_server(base_url, username, password) do
    url = String.trim_trailing(base_url, "/") <> "/openapi.json"
    Mix.shell().info("🌐 Downloading OpenAPI spec from #{url}")
    download_spec(url, username, password)
  end

  defp download_spec(url, username, password) do
    req =
      case {username, password} do
        {nil, _} -> Req.get(url, receive_timeout: 15_000)
        {user, pass} -> Req.get(url, receive_timeout: 15_000, auth: {:basic, "#{user}:#{pass}"})
      end

    case req do
      {:ok, %{status: 200, body: body}} when is_map(body) ->
        # Guard against downloading the web UI's HTML shell or an auth error
        # page: a real spec has an `openapi` version and a `paths` object.
        unless is_binary(body["openapi"]) and is_map(body["paths"]) do
          Mix.raise("""
          The response from #{url} is not an OpenAPI document.

          Expected a JSON object with "openapi" and "paths" keys, got keys: #{inspect(Map.keys(body))}

          Common causes:
            - The base URL points at the web UI rather than the API
            - The server password is wrong (v2 returns 401 for every request)
          """)
        end

        File.mkdir_p!(Path.dirname(@spec_file))
        File.write!(@spec_file, Jason.encode!(body))
        Mix.shell().info("✓ Saved spec to #{@spec_file} (#{length(body["paths"])} paths)")
        @spec_file

      {:ok, %{status: status}} ->
        Mix.raise("""
        #{url} returned HTTP #{status}.

        OpenCode v2 requires HTTP Basic auth on every route, including
        /openapi.json. Pass --server-username and --server-password, or set
        OPENCODE_SERVER_PASSWORD before starting the server.

        Alternatively download the published spec with no arguments, or pass
        a local file:
          mix opencode.gen.client --spec path/to/spec.json
        """)

      {:error, error} ->
        Mix.raise("""
        Failed to fetch the OpenAPI spec from #{url}: #{inspect(error)}

        You can also use a local spec file:
          mix opencode.gen.client --spec path/to/spec.json
        """)
    end
  end
end
