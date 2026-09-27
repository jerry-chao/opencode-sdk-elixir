defmodule OpenCode.Generated.Plugin do
  @moduledoc """
  Provides API endpoints related to plugin
  """

  @default_client OpenCode.Client

  @type plugin_check_200_json_resp :: %{
          data: [OpenCode.Generated.PluginInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Check plugin updates

  Check one or all package plugins for available updates.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec plugin_check(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Plugin.plugin_check_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def plugin_check(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Plugin, :plugin_check},
      url: "/api/plugin/check",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Plugin, :plugin_check_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type plugin_list_200_json_resp :: %{
          data: [OpenCode.Generated.PluginInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List plugins

  Retrieve enabled server plugins and their current status.

  ## Options

    * `location`

  """
  @spec plugin_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Plugin.plugin_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def plugin_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Plugin, :plugin_list},
      url: "/api/plugin",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Plugin, :plugin_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update plugins

  Update package plugins concurrently and notify active locations to reload them. Responds once every update has finished; fails when any update fails.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec plugin_update(body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def plugin_update(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Plugin, :plugin_update},
      url: "/api/plugin/update",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:plugin_check_200_json_resp) do
    [
      data: [{OpenCode.Generated.PluginInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:plugin_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.PluginInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
