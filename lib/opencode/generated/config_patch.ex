defmodule OpenCode.Generated.ConfigPatch do
  @moduledoc """
  Provides struct and type for a ConfigPatch
  """

  @type t :: %__MODULE__{shell: String.t() | nil}

  defstruct [:shell]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [shell: {:union, [:string, :null]}]
  end
end
