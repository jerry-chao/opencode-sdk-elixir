defmodule OpenCode.Generated.ModelInfoTime do
  @moduledoc """
  Provides struct and type for a ModelInfoTime
  """

  @type t :: %__MODULE__{released: number}

  defstruct [:released]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [released: :number]
  end
end
