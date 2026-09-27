defmodule OpenCode.Generated.Config do
  @moduledoc """
  Provides API endpoints related to config
  """

  @default_client OpenCode.Client

  @doc """
  Get configuration

  Return configuration documents and discovery sources for the requested location, from lowest to highest priority.

  ## Options

    * `location`

  """
  @spec config_get(opts :: keyword) ::
          {:ok,
           [
             OpenCode.Generated.ConfigDirectoryEncoded.t()
             | OpenCode.Generated.ConfigDocumentEncoded.t()
           ]}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def config_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Config, :config_get},
      url: "/api/config",
      method: :get,
      query: query,
      response: [
        {200,
         [
           union: [
             {OpenCode.Generated.ConfigDirectoryEncoded, :t},
             {OpenCode.Generated.ConfigDocumentEncoded, :t}
           ]
         ]},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List available shells

  Return shells available to terminal and agent execution.
  """
  @spec config_shells(opts :: keyword) ::
          {:ok, [OpenCode.Generated.ConfigShellOption.t()]}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def config_shells(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Config, :config_shells},
      url: "/api/config/shell",
      method: :get,
      response: [
        {200, [{OpenCode.Generated.ConfigShellOption, :t}]},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update global configuration

  Patch supported fields in the highest-precedence global configuration document.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_config_update(body :: OpenCode.Generated.ConfigPatch.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_config_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Config, :experimental_config_update},
      url: "/api/experimental/config",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenCode.Generated.ConfigPatch, :t}}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
