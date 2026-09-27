defmodule OpenCode.Generated.SessionMessageAssistantText do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistantText
  """

  @type t :: %__MODULE__{state: map | nil, text: String.t(), type: String.t()}

  defstruct [:state, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [state: :map, text: :string, type: {:const, "text"}]
  end
end
