defmodule OpenCode.Generated.VcsBranch do
  @moduledoc """
  Provides struct and type for a VcsBranch
  """

  @type t :: %__MODULE__{current: String.t() | nil, default: String.t() | nil}

  defstruct [:current, :default]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [current: :string, default: :string]
  end
end
