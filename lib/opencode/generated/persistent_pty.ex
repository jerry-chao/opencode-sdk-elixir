defmodule OpenCode.Generated.PersistentPty do
  @moduledoc """
  Provides API endpoints related to persistent pty
  """

  @default_client OpenCode.Client

  @doc """
  Connect to a persistent PTY

  Stream persistent PTY output through the OpenCode server.

  ## Options

    * `cursor`
    * `role`
    * `attachment_id`
    * `takeover`
    * `input_protocol`
    * `ticket`

  """
  @spec persistent_pty_connect(ptyID :: String.t(), opts :: keyword) ::
          {:ok, boolean}
          | {:error,
             OpenCode.Generated.ForbiddenErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def persistent_pty_connect(ptyID, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:attachment_id, :cursor, :input_protocol, :role, :takeover, :ticket])

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.PersistentPty, :persistent_pty_connect},
      url: "/api/experimental/persistent-pty/#{ptyID}/connect",
      method: :get,
      query: query,
      response: [
        {200, :boolean},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {403, {OpenCode.Generated.ForbiddenErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_connect_token_200_json_resp :: %{
          data: OpenCode.Generated.PtyTicketConnectToken.t()
        }

  @doc """
  post `/api/experimental/persistent-pty/{ptyID}/connect-token`
  """
  @spec server_experimental_persistent_pty_connect_token(ptyID :: String.t(), opts :: keyword) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_connect_token_200_json_resp()}
          | {:error,
             OpenCode.Generated.ForbiddenErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_connect_token(ptyID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_connect_token},
      url: "/api/experimental/persistent-pty/#{ptyID}/connect-token",
      method: :post,
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_connect_token_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {403, {OpenCode.Generated.ForbiddenErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_create_200_json_resp :: %{
          data: OpenCode.Generated.PersistentPtyInfo.t()
        }

  @doc """
  post `/api/experimental/session/{sessionID}/terminal`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec server_experimental_persistent_pty_create(
          sessionID :: String.t(),
          body :: OpenCode.Generated.PersistentPtyCreateInput.t(),
          opts :: keyword
        ) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_create_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_create(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_create},
      url: "/api/experimental/session/#{sessionID}/terminal",
      body: body,
      method: :post,
      request: [{"application/json", {OpenCode.Generated.PersistentPtyCreateInput, :t}}],
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_create_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_get_200_json_resp :: %{
          data: OpenCode.Generated.PersistentPtyInfo.t()
        }

  @doc """
  get `/api/experimental/persistent-pty/{ptyID}`
  """
  @spec server_experimental_persistent_pty_get(ptyID :: String.t(), opts :: keyword) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_get(ptyID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_get},
      url: "/api/experimental/persistent-pty/#{ptyID}",
      method: :get,
      response: [
        {200,
         {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_handoff_200_json_resp :: %{
          handoff: OpenCode.Generated.PersistentPtyHandoff.t() | nil
        }

  @doc """
  post `/api/experimental/persistent-pty/handoff`
  """
  @spec server_experimental_persistent_pty_handoff(opts :: keyword) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_handoff_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_handoff(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_handoff},
      url: "/api/experimental/persistent-pty/handoff",
      method: :post,
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_handoff_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_list_200_json_resp :: %{
          data: [OpenCode.Generated.PersistentPtyInfo.t()]
        }

  @doc """
  get `/api/experimental/session/{sessionID}/terminal`
  """
  @spec server_experimental_persistent_pty_list(sessionID :: String.t(), opts :: keyword) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_list(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_list},
      url: "/api/experimental/session/#{sessionID}/terminal",
      method: :get,
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_read_200_json_resp :: %{
          data: OpenCode.Generated.PersistentPtyReadResult.t() | nil
        }

  @doc """
  Read the session's most recently controlled terminal

  Read the last physical rows without changing selection or taking control. Omitted lines uses the live terminal height; larger counts include retained history. Blank rows are preserved. Screen dimensions and cursor remain relative to the live screen. Returns null when no current terminal exists. Selection is server-local and resets on restart. Experimental: may change without compatibility guarantees.

  ## Options

    * `lines`

  """
  @spec server_experimental_persistent_pty_read(sessionID :: String.t(), opts :: keyword) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_read_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_read(sessionID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:lines])

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_read},
      url: "/api/experimental/session/#{sessionID}/terminal/read",
      method: :get,
      query: query,
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_read_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/api/experimental/persistent-pty/{ptyID}`
  """
  @spec server_experimental_persistent_pty_remove(ptyID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_remove(ptyID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_remove},
      url: "/api/experimental/persistent-pty/#{ptyID}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/api/experimental/persistent-pty/shutdown`
  """
  @spec server_experimental_persistent_pty_shutdown(opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_shutdown(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_shutdown},
      url: "/api/experimental/persistent-pty/shutdown",
      method: :post,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_snapshot_200_json_resp :: %{
          data: OpenCode.Generated.PersistentPtySnapshot.t()
        }

  @doc """
  get `/api/experimental/persistent-pty/{ptyID}/snapshot`
  """
  @spec server_experimental_persistent_pty_snapshot(ptyID :: String.t(), opts :: keyword) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_snapshot_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_snapshot(ptyID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ptyID: ptyID],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_snapshot},
      url: "/api/experimental/persistent-pty/#{ptyID}/snapshot",
      method: :get,
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_snapshot_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type server_experimental_persistent_pty_update_200_json_resp :: %{
          data: OpenCode.Generated.PersistentPtyInfo.t()
        }

  @doc """
  put `/api/experimental/persistent-pty/{ptyID}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec server_experimental_persistent_pty_update(
          ptyID :: String.t(),
          body :: OpenCode.Generated.PersistentPtyUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok,
           OpenCode.Generated.PersistentPty.server_experimental_persistent_pty_update_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PtyNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_experimental_persistent_pty_update(ptyID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ptyID: ptyID, body: body],
      call: {OpenCode.Generated.PersistentPty, :server_experimental_persistent_pty_update},
      url: "/api/experimental/persistent-pty/#{ptyID}",
      body: body,
      method: :put,
      request: [{"application/json", {OpenCode.Generated.PersistentPtyUpdateInput, :t}}],
      response: [
        {200,
         {OpenCode.Generated.PersistentPty,
          :server_experimental_persistent_pty_update_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.PtyNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:server_experimental_persistent_pty_connect_token_200_json_resp) do
    [data: {OpenCode.Generated.PtyTicketConnectToken, :t}]
  end

  def __fields__(:server_experimental_persistent_pty_create_200_json_resp) do
    [data: {OpenCode.Generated.PersistentPtyInfo, :t}]
  end

  def __fields__(:server_experimental_persistent_pty_get_200_json_resp) do
    [data: {OpenCode.Generated.PersistentPtyInfo, :t}]
  end

  def __fields__(:server_experimental_persistent_pty_handoff_200_json_resp) do
    [handoff: {:union, [{OpenCode.Generated.PersistentPtyHandoff, :t}, :null]}]
  end

  def __fields__(:server_experimental_persistent_pty_list_200_json_resp) do
    [data: [{OpenCode.Generated.PersistentPtyInfo, :t}]]
  end

  def __fields__(:server_experimental_persistent_pty_read_200_json_resp) do
    [data: {:union, [{OpenCode.Generated.PersistentPtyReadResult, :t}, :null]}]
  end

  def __fields__(:server_experimental_persistent_pty_snapshot_200_json_resp) do
    [data: {OpenCode.Generated.PersistentPtySnapshot, :t}]
  end

  def __fields__(:server_experimental_persistent_pty_update_200_json_resp) do
    [data: {OpenCode.Generated.PersistentPtyInfo, :t}]
  end
end
