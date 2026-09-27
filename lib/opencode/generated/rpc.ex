defmodule OpenCode.Generated.Rpc do
  @moduledoc """
  Provides API endpoint related to rpc
  """

  @default_client OpenCode.Client

  @doc """
  Call a plugin RPC

  Dispatch a method to the currently registered RPC at the requested location.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec rpc_call(
          rpcID :: String.t(),
          method :: String.t(),
          body :: OpenCode.Generated.RpcInput.t(),
          opts :: keyword
        ) ::
          {:ok, OpenCode.Generated.RpcOutput.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.RpcErrorEncoded.t()
             | OpenCode.Generated.RpcInternalErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def rpc_call(rpcID, method, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [rpcID: rpcID, method: method, body: body],
      call: {OpenCode.Generated.Rpc, :rpc_call},
      url: "/api/rpc/#{rpcID}/#{method}",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {OpenCode.Generated.RpcInput, :t}}],
      response: [
        {200, {OpenCode.Generated.RpcOutput, :t}},
        {400,
         {:union,
          [
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t},
            {OpenCode.Generated.RpcErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {500, {OpenCode.Generated.RpcInternalErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
