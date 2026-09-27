defmodule OpenCode.Generated.PersistentPtyCreateInputSize do
  @moduledoc """
  Provides struct and type for a PersistentPtyCreateInputSize
  """

  @type t :: %__MODULE__{cols: integer, rows: integer}

  defstruct [:cols, :rows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cols: :integer, rows: :integer]
  end
end
