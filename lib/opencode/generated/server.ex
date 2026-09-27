defmodule OpenCode.Generated.Server do
  @moduledoc """
  Provides API endpoint related to server
  """

  @default_client OpenCode.Client

  @doc """
  Get server info

  Return the server identity, connection URLs, paths, and readiness status.
  """
  @spec server_info(opts :: keyword) ::
          {:ok, OpenCode.Generated.ServerInfo.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def server_info(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Server, :server_info},
      url: "/api/info",
      method: :get,
      response: [
        {200, {OpenCode.Generated.ServerInfo, :t}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
