defmodule OpenCode.Generated.Generate do
  @moduledoc """
  Provides API endpoint related to generate
  """

  @default_client OpenCode.Client

  @doc """
  Generate text

  Run one stateless model generation using the server's base configuration and return the assistant text. Uses the base configuration's default model when none is specified.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_generate_text(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.GenerateTextResponse.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_generate_text(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Generate, :experimental_generate_text},
      url: "/api/experimental/generate",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.GenerateTextResponse, :t}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
