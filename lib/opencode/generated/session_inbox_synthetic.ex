defmodule OpenCode.Generated.SessionInboxSynthetic do
  @moduledoc """
  Provides struct and type for a SessionInboxSynthetic
  """

  @type t :: %__MODULE__{
          delivery: String.t(),
          id: String.t(),
          payload: OpenCode.Generated.SessionInboxSyntheticPayload.t(),
          session_id: String.t(),
          time: OpenCode.Generated.SessionInboxSyntheticTime.t(),
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
      payload: {OpenCode.Generated.SessionInboxSyntheticPayload, :t},
      session_id: :string,
      time: {OpenCode.Generated.SessionInboxSyntheticTime, :t},
      type: {:const, "synthetic"}
    ]
  end
end
