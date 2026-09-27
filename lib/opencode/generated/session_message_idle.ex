defmodule OpenCode.Generated.SessionMessageIdle do
  @moduledoc """
  Provides struct and type for a SessionMessageIdle
  """

  @type t :: %__MODULE__{
          id: String.t(),
          metadata: map | nil,
          outcome: String.t(),
          time: OpenCode.Generated.SessionMessageIdleTime.t(),
          type: String.t()
        }

  defstruct [:id, :metadata, :outcome, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      metadata: :map,
      outcome: {:enum, ["succeeded", "failed", "interrupted"]},
      time: {OpenCode.Generated.SessionMessageIdleTime, :t},
      type: {:const, "idle"}
    ]
  end
end
