defmodule OpenCode.Generated.SessionMessageAssistantReasoning do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistantReasoning
  """

  @type t :: %__MODULE__{
          state: map | nil,
          text: String.t(),
          time: OpenCode.Generated.SessionMessageAssistantReasoningTime.t() | nil,
          type: String.t()
        }

  defstruct [:state, :text, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      state: :map,
      text: :string,
      time: {OpenCode.Generated.SessionMessageAssistantReasoningTime, :t},
      type: {:const, "reasoning"}
    ]
  end
end
