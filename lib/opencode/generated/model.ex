defmodule OpenCode.Generated.Model do
  @moduledoc """
  Provides API endpoints related to model
  """

  @default_client OpenCode.Client

  @type model_default_200_json_resp :: %{
          data: OpenCode.Generated.ModelInfo.t() | nil,
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Get default model

  Retrieve the model used when a session has no explicit model selection.

  ## Options

    * `location`

  """
  @spec model_default(opts :: keyword) ::
          {:ok, OpenCode.Generated.Model.model_default_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def model_default(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Model, :model_default},
      url: "/api/model/default",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Model, :model_default_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type model_list_200_json_resp :: %{
          data: [OpenCode.Generated.ModelInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List models

  Retrieve the current snapshot of available models ordered by release date. The snapshot may precede initial plugin settlement.

  ## Options

    * `location`

  """
  @spec model_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Model.model_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def model_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Model, :model_list},
      url: "/api/model",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Model, :model_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:model_default_200_json_resp) do
    [
      data: {:union, [{OpenCode.Generated.ModelInfo, :t}, :null]},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:model_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.ModelInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
