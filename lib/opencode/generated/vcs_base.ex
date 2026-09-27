defmodule OpenCode.Generated.VcsBase do
  @moduledoc """
  Provides struct and type for a VcsBase
  """

  @type t :: %__MODULE__{name: String.t(), ref: String.t(), source: String.t()}

  defstruct [:name, :ref, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string, ref: :string, source: {:enum, ["reflog", "default"]}]
  end
end
