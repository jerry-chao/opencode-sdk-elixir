defmodule OpenCode.Generated.Event do
  @moduledoc """
  Provides API endpoint related to event
  """

  @default_client OpenCode.Client

  @type event_subscribe_200__resp :: %{data: String.t(), event: String.t(), id: String.t() | nil}

  @doc """
  Subscribe to events

  Subscribe to native events and plugin RPC events across all server locations. Volatile by contract: a slow consumer overflows and fails the stream, and events during disconnection are missed.
  """
  @spec event_subscribe(opts :: keyword) ::
          {:ok, OpenCode.Generated.Event.event_subscribe_200__resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def event_subscribe(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Event, :event_subscribe},
      url: "/api/event",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Event, :event_subscribe_200__resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:event_subscribe_200__resp) do
    [data: :string, event: :string, id: {:union, [:string, :null]}]
  end
end
