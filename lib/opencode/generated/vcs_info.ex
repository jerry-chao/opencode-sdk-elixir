defmodule OpenCode.Generated.VcsInfo do
  @moduledoc """
  Provides struct and type for a VcsInfo
  """

  @type t :: %__MODULE__{branch: OpenCode.Generated.VcsBranch.t(), provider: String.t() | nil}

  defstruct [:branch, :provider]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [branch: {OpenCode.Generated.VcsBranch, :t}, provider: :string]
  end
end
