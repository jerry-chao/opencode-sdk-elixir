defmodule OpenCode.Generated.Location do
  @moduledoc """
  Provides API endpoints related to location
  """

  @default_client OpenCode.Client

  @doc """
  Get location

  Resolve the requested location or the server default location.

  ## Options

    * `location`

  """
  @spec location_get(opts :: keyword) ::
          {:ok, OpenCode.Generated.LocationPublicInfo.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def location_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Location, :location_get},
      url: "/api/location",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.LocationPublicInfo, :t}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reload configuration

  Shut down and rebuild every loaded location. Pending permissions and forms are cancelled; running sessions continue with fresh services at the next step boundary. Emits location.shutdown for client recovery and responds once all replacement builds settle.
  """
  @spec location_reload(opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def location_reload(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Location, :location_reload},
      url: "/api/location/reload",
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
end
