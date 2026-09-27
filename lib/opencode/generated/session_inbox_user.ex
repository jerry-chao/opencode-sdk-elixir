defmodule OpenCode.Generated.SessionInboxUser do
  @moduledoc """
  Provides struct and type for a SessionInboxUser
  """

  @type t :: %__MODULE__{
          delivery: String.t(),
          id: String.t(),
          payload: OpenCode.Generated.SessionInboxUserPayload.t(),
          session_id: String.t(),
          time: OpenCode.Generated.SessionInboxUserTime.t(),
          type: String.t()
        }

  defstruct [:delivery, :id, :payload, :session_id, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delivery: {:enum, ["steer", "queue"]},
      id: :string,
      payload: {OpenCode.Generated.SessionInboxUserPayload, :t},
      session_id: :string,
      time: {OpenCode.Generated.SessionInboxUserTime, :t},
      type: {:const, "user"}
    ]
  end
end
