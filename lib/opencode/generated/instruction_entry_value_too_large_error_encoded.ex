defmodule OpenCode.Generated.InstructionEntryValueTooLargeErrorEncoded do
  @moduledoc """
  Provides struct and type for a InstructionEntryValueTooLargeErrorEncoded
  """

  @type t :: %__MODULE__{
          actual_bytes: integer,
          max_bytes: integer,
          message: String.t(),
          tag: String.t()
        }

  defstruct [:actual_bytes, :max_bytes, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actual_bytes: :integer,
      max_bytes: :integer,
      message: :string,
      tag: {:const, "InstructionEntryValueTooLargeError"}
    ]
  end
end
