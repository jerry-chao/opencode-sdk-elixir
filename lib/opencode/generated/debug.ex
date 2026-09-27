defmodule OpenCode.Generated.Debug do
  @moduledoc """
  Provides API endpoints related to debug
  """

  @default_client OpenCode.Client

  @doc """
  Evict a loaded location

  Dispose the requested location's cached services so its next use boots them fresh.

  ## Options

    * `location`

  """
  @spec debug_location_evict(opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def debug_location_evict(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Debug, :debug_location_evict},
      url: "/api/debug/location",
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

  @doc """
  List loaded locations

  List locations currently loaded by the server.
  """
  @spec debug_location_list(opts :: keyword) ::
          {:ok, [OpenCode.Generated.LocationPublicRef.t()]}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def debug_location_list(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Debug, :debug_location_list},
      url: "/api/debug/location",
      method: :get,
      response: [
        {200, [{OpenCode.Generated.LocationPublicRef, :t}]},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
