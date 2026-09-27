defmodule OpenCode.Generated.SessionInterruptResponse do
  @moduledoc """
  Provides struct and type for a SessionInterruptResponse
  """

  @type t :: %__MODULE__{interrupted: boolean}

  defstruct [:interrupted]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [interrupted: :boolean]
  end
end
