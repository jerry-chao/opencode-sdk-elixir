defmodule OpenCode.Generated.ShellInfoTime do
  @moduledoc """
  Provides struct and type for a ShellInfoTime
  """

  @type t :: %__MODULE__{completed: number | nil, started: number}

  defstruct [:completed, :started]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [completed: :number, started: :number]
  end
end
