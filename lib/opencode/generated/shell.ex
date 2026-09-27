defmodule OpenCode.Generated.Shell do
  @moduledoc """
  Provides API endpoints related to shell
  """

  @default_client OpenCode.Client

  @type shell_create_200_json_resp :: %{
          data: OpenCode.Generated.ShellInfo.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Run shell command

  Spawn one non-interactive shell command for a location. Combined stdout/stderr is captured to a file pageable via output.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec shell_create(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Shell.shell_create_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def shell_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Shell, :shell_create},
      url: "/api/shell",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Shell, :shell_create_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type shell_get_200_json_resp :: %{
          data: OpenCode.Generated.ShellInfo.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Get shell command

  Get one shell command, including its status and exit code once exited.

  ## Options

    * `location`

  """
  @spec shell_get(id :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Shell.shell_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ShellNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def shell_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [id: id],
      call: {OpenCode.Generated.Shell, :shell_get},
      url: "/api/shell/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Shell, :shell_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ShellNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type shell_list_200_json_resp :: %{
          data: [OpenCode.Generated.ShellInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List running shell commands

  List currently running shell commands for a location. Exited commands are not included.

  ## Options

    * `location`

  """
  @spec shell_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Shell.shell_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def shell_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Shell, :shell_list},
      url: "/api/shell",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Shell, :shell_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type shell_output_200_json_resp :: %{
          data: OpenCode.Generated.Shell.shell_output_200_json_resp_data(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @type shell_output_200_json_resp_data :: %{
          cursor: integer,
          output: String.t(),
          size: integer,
          truncated: boolean
        }

  @doc """
  Read shell output

  Page through captured combined output by absolute byte cursor.

  ## Options

    * `location`
    * `cursor`
    * `limit`

  """
  @spec shell_output(id :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Shell.shell_output_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ShellNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def shell_output(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :location])

    client.request(%{
      args: [id: id],
      call: {OpenCode.Generated.Shell, :shell_output},
      url: "/api/shell/#{id}/output",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Shell, :shell_output_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ShellNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove shell command

  Terminate and remove one shell command and its retained output.

  ## Options

    * `location`

  """
  @spec shell_remove(id :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def shell_remove(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [id: id],
      call: {OpenCode.Generated.Shell, :shell_remove},
      url: "/api/shell/#{id}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:shell_create_200_json_resp) do
    [
      data: {OpenCode.Generated.ShellInfo, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:shell_get_200_json_resp) do
    [
      data: {OpenCode.Generated.ShellInfo, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:shell_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.ShellInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:shell_output_200_json_resp) do
    [
      data: {OpenCode.Generated.Shell, :shell_output_200_json_resp_data},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:shell_output_200_json_resp_data) do
    [cursor: :integer, output: :string, size: :integer, truncated: :boolean]
  end
end
