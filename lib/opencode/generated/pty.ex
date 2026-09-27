defmodule OpenCode.Generated.Pty do
  @moduledoc """
  Provides API endpoints related to pty
  """

  @default_client OpenCode.Client

  @doc """
  Connect to PTY session

  Establish a WebSocket connection streaming PTY output and accepting terminal input.

  ## Options

    * `location[directory]`
    * `cursor`
    * `ticket`

  """
  @spec pty_connect(ptyID :: String.t(), opts :: keyword) ::
          {:ok, boolean}
          | {:error,
             OpenCode.Generated.ForbiddenErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_connect(ptyID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :"location[directory]", :ticket])

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.Pty, :pty_connect},
      url: "/api/pty/#{ptyID}/connect",
      method: :get,
      query: query,
      response: [
        {200, :boolean},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {403, {OpenCode.Generated.ForbiddenErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type pty_connect_token_200_json_resp :: %{
          data: OpenCode.Generated.PtyTicketConnectToken.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Create PTY WebSocket token

  Create a short-lived single-use ticket for opening a PTY WebSocket connection.

  ## Options

    * `location`

  """
  @spec pty_connect_token(ptyID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Pty.pty_connect_token_200_json_resp()}
          | {:error,
             OpenCode.Generated.ForbiddenErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_connect_token(ptyID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.Pty, :pty_connect_token},
      url: "/api/pty/#{ptyID}/connect-token",
      method: :post,
      query: query,
      response: [
        {200, {OpenCode.Generated.Pty, :pty_connect_token_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {403, {OpenCode.Generated.ForbiddenErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type pty_create_200_json_resp :: %{
          data: OpenCode.Generated.Pty.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Create PTY session

  Create a pseudo-terminal session for a location.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec pty_create(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Pty.pty_create_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Pty, :pty_create},
      url: "/api/pty",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Pty, :pty_create_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type pty_get_200_json_resp :: %{
          data: OpenCode.Generated.Pty.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Get PTY session

  Get one PTY session, including its exit code once exited.

  ## Options

    * `location`

  """
  @spec pty_get(ptyID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Pty.pty_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_get(ptyID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.Pty, :pty_get},
      url: "/api/pty/#{ptyID}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Pty, :pty_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type pty_list_200_json_resp :: %{
          data: [OpenCode.Generated.Pty.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List PTY sessions

  List PTY sessions for a location, including exited sessions retained until removal.

  ## Options

    * `location`

  """
  @spec pty_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Pty.pty_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Pty, :pty_list},
      url: "/api/pty",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Pty, :pty_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove PTY session

  Terminate and remove one PTY session.

  ## Options

    * `location`

  """
  @spec pty_remove(ptyID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_remove(ptyID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.Pty, :pty_remove},
      url: "/api/pty/#{ptyID}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type pty_update_200_json_resp :: %{
          data: OpenCode.Generated.Pty.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Update PTY session

  Update the title or viewport size of one PTY session.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec pty_update(ptyID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Pty.pty_update_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def pty_update(ptyID, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [ptyID: ptyID, body: body],
      call: {OpenCode.Generated.Pty, :pty_update},
      url: "/api/pty/#{ptyID}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Pty, :pty_update_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          args: [String.t()],
          command: String.t(),
          cwd: String.t(),
          exit_code: integer | nil,
          id: String.t(),
          pid: integer,
          status: String.t(),
          title: String.t()
        }

  defstruct [:args, :command, :cwd, :exit_code, :id, :pid, :status, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:pty_connect_token_200_json_resp) do
    [
      data: {OpenCode.Generated.PtyTicketConnectToken, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:pty_create_200_json_resp) do
    [data: {OpenCode.Generated.Pty, :t}, location: {OpenCode.Generated.LocationPublicRef, :t}]
  end

  def __fields__(:pty_get_200_json_resp) do
    [data: {OpenCode.Generated.Pty, :t}, location: {OpenCode.Generated.LocationPublicRef, :t}]
  end

  def __fields__(:pty_list_200_json_resp) do
    [data: [{OpenCode.Generated.Pty, :t}], location: {OpenCode.Generated.LocationPublicRef, :t}]
  end

  def __fields__(:pty_update_200_json_resp) do
    [data: {OpenCode.Generated.Pty, :t}, location: {OpenCode.Generated.LocationPublicRef, :t}]
  end

  def __fields__(:t) do
    [
      args: [:string],
      command: :string,
      cwd: :string,
      exit_code: :integer,
      id: :string,
      pid: :integer,
      status: {:enum, ["running", "exited"]},
      title: :string
    ]
  end
end
