defmodule OpenCode.Generated.Reference do
  @moduledoc """
  Provides API endpoint related to reference
  """

  @default_client OpenCode.Client

  @type reference_list_200_json_resp :: %{
          data: [OpenCode.Generated.ReferenceInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List references

  List references available in the requested location.

  ## Options

    * `location`

  """
  @spec reference_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Reference.reference_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def reference_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Reference, :reference_list},
      url: "/api/reference",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Reference, :reference_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:reference_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.ReferenceInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
