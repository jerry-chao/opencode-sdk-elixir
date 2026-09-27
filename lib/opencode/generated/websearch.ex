defmodule OpenCode.Generated.Websearch do
  @moduledoc """
  Provides API endpoints related to websearch
  """

  @default_client OpenCode.Client

  @type websearch_providers_200_json_resp :: %{
          data: [OpenCode.Generated.WebSearchProvider.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List web search providers

  Return the registered web search providers.

  ## Options

    * `location`

  """
  @spec websearch_providers(opts :: keyword) ::
          {:ok, OpenCode.Generated.Websearch.websearch_providers_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def websearch_providers(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Websearch, :websearch_providers},
      url: "/api/websearch/provider",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Websearch, :websearch_providers_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type websearch_query_200_json_resp :: %{
          data: OpenCode.Generated.WebSearchResponseEncoded.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Search the web

  Run one web search through the selected provider. Specify a provider to override the configured default.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec websearch_query(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Websearch.websearch_query_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def websearch_query(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Websearch, :websearch_query},
      url: "/api/websearch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Websearch, :websearch_query_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:websearch_providers_200_json_resp) do
    [
      data: [{OpenCode.Generated.WebSearchProvider, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:websearch_query_200_json_resp) do
    [
      data: {OpenCode.Generated.WebSearchResponseEncoded, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
