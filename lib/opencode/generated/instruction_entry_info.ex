defmodule OpenCode.Generated.InstructionEntryInfo do
  @moduledoc """
  Provides struct and type for a InstructionEntryInfo
  """

  @type t :: %__MODULE__{key: String.t(), value: map}

  defstruct [:key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [key: :string, value: :map]
  end
end
