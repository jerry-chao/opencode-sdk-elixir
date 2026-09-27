defmodule OpenCode.Generated.Command do
  @moduledoc """
  Provides API endpoint related to command
  """

  @default_client OpenCode.Client

  @type command_list_200_json_resp :: %{
          data: [OpenCode.Generated.CommandInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List commands

  Retrieve currently registered commands.

  ## Options

    * `location`

  """
  @spec command_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Command.command_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def command_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Command, :command_list},
      url: "/api/command",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Command, :command_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:command_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.CommandInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
