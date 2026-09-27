defmodule OpenCode.Generated.Provider do
  @moduledoc """
  Provides API endpoints related to provider
  """

  @default_client OpenCode.Client

  @type provider_get_200_json_resp :: %{
          data: OpenCode.Generated.ProviderInfo.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Get provider

  Retrieve a single AI provider so clients can inspect its availability and endpoint settings.

  ## Options

    * `location`

  """
  @spec provider_get(providerID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Provider.provider_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ProviderNotFoundErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def provider_get(providerID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [providerID: providerID],
      call: {OpenCode.Generated.Provider, :provider_get},
      url: "/api/provider/#{providerID}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Provider, :provider_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ProviderNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type provider_list_200_json_resp :: %{
          data: [OpenCode.Generated.ProviderInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List providers

  Retrieve active AI providers so clients can show provider availability and configuration.

  ## Options

    * `location`

  """
  @spec provider_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Provider.provider_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def provider_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Provider, :provider_list},
      url: "/api/provider",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Provider, :provider_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:provider_get_200_json_resp) do
    [
      data: {OpenCode.Generated.ProviderInfo, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:provider_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.ProviderInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
