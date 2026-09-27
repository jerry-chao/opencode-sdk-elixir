defmodule OpenCode.Generated.SessionInboxCompaction do
  @moduledoc """
  Provides struct and type for a SessionInboxCompaction
  """

  @type t :: %__MODULE__{
          delivery: String.t(),
          id: String.t(),
          payload: map | [any],
          session_id: String.t(),
          time: OpenCode.Generated.SessionInboxCompactionTime.t(),
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
      payload: {:union, [:map, [:unknown]]},
      session_id: :string,
      time: {OpenCode.Generated.SessionInboxCompactionTime, :t},
      type: {:const, "compaction"}
    ]
  end
end
