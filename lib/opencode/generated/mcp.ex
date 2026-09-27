defmodule OpenCode.Generated.Mcp do
  @moduledoc """
  Provides API endpoints related to mcp
  """

  @default_client OpenCode.Client

  @doc """
  Add MCP server

  Add an MCP server at runtime or replace an existing one, connecting it immediately.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_mcp_add(server :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_mcp_add(server, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [server: server, body: body],
      call: {OpenCode.Generated.Mcp, :experimental_mcp_add},
      url: "/api/experimental/mcp/#{server}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Connect MCP server

  Connect an MCP server at runtime, overriding a disabled configuration until restart.

  ## Options

    * `location`

  """
  @spec experimental_mcp_connect(server :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.McpServerNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_mcp_connect(server, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [server: server],
      call: {OpenCode.Generated.Mcp, :experimental_mcp_connect},
      url: "/api/experimental/mcp/#{server}/connect",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.McpServerNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Disconnect MCP server

  Disconnect an MCP server at runtime, removing its tools until reconnected.

  ## Options

    * `location`

  """
  @spec experimental_mcp_disconnect(server :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.McpServerNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_mcp_disconnect(server, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [server: server],
      call: {OpenCode.Generated.Mcp, :experimental_mcp_disconnect},
      url: "/api/experimental/mcp/#{server}/disconnect",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.McpServerNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove MCP server

  Stop an MCP server and remove it from the runtime set until restart.

  ## Options

    * `location`

  """
  @spec experimental_mcp_remove(server :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.McpServerNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_mcp_remove(server, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [server: server],
      call: {OpenCode.Generated.Mcp, :experimental_mcp_remove},
      url: "/api/experimental/mcp/#{server}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.McpServerNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type mcp_list_200_json_resp :: %{
          data: [OpenCode.Generated.McpServer.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List MCP servers

  Retrieve configured MCP servers and their connection status.

  ## Options

    * `location`

  """
  @spec mcp_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Mcp.mcp_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def mcp_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Mcp, :mcp_list},
      url: "/api/mcp",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Mcp, :mcp_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type mcp_resource_catalog_200_json_resp :: %{
          data: OpenCode.Generated.McpResourceCatalog.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List MCP resources

  Retrieve resources and resource templates from connected MCP servers.

  ## Options

    * `location`

  """
  @spec mcp_resource_catalog(opts :: keyword) ::
          {:ok, OpenCode.Generated.Mcp.mcp_resource_catalog_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def mcp_resource_catalog(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Mcp, :mcp_resource_catalog},
      url: "/api/mcp/resource",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Mcp, :mcp_resource_catalog_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:mcp_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.McpServer, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:mcp_resource_catalog_200_json_resp) do
    [
      data: {OpenCode.Generated.McpResourceCatalog, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
