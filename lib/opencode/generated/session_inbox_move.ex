defmodule OpenCode.Generated.SessionInboxMove do
  @moduledoc """
  Provides struct and type for a SessionInboxMove
  """

  @type t :: %__MODULE__{
          delivery: String.t(),
          id: String.t(),
          payload: OpenCode.Generated.SessionInboxMovePayload.t(),
          session_id: String.t(),
          time: OpenCode.Generated.SessionInboxMoveTime.t(),
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
      payload: {OpenCode.Generated.SessionInboxMovePayload, :t},
      session_id: :string,
      time: {OpenCode.Generated.SessionInboxMoveTime, :t},
      type: {:const, "move"}
    ]
  end
end
