defmodule OpenCode.Generated.FormOption do
  @moduledoc """
  Provides struct and type for a FormOption
  """

  @type t :: %__MODULE__{description: String.t() | nil, label: String.t(), value: String.t()}

  defstruct [:description, :label, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, label: :string, value: :string]
  end
end
