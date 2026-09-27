defmodule OpenCode.Generated.Form do
  @moduledoc """
  Provides API endpoint related to form
  """

  @default_client OpenCode.Client

  @type form_list_200_json_resp :: %{
          data: [OpenCode.Generated.FormInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List pending forms

  Retrieve pending forms for a location.

  ## Options

    * `location`

  """
  @spec form_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Form.form_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def form_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Form, :form_list},
      url: "/api/form",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Form, :form_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:form_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.FormInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
