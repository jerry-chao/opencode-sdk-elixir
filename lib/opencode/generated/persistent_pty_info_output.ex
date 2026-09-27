defmodule OpenCode.Generated.PersistentPtyInfoOutput do
  @moduledoc """
  Provides struct and type for a PersistentPtyInfoOutput
  """

  @type t :: %__MODULE__{head: integer, tail: integer}

  defstruct [:head, :tail]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [head: :integer, tail: :integer]
  end
end
