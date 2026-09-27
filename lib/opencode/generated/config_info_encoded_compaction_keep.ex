defmodule OpenCode.Generated.ConfigInfoEncodedCompactionKeep do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedCompactionKeep
  """

  @type t :: %__MODULE__{tokens: integer | nil}

  defstruct [:tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tokens: :integer]
  end
end
