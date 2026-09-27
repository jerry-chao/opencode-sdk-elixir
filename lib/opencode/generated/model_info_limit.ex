defmodule OpenCode.Generated.ModelInfoLimit do
  @moduledoc """
  Provides struct and type for a ModelInfoLimit
  """

  @type t :: %__MODULE__{context: integer, input: integer | nil, output: integer}

  defstruct [:context, :input, :output]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [context: :integer, input: :integer, output: :integer]
  end
end
