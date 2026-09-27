defmodule OpenCode.Generated.ConfigWebSearchInfoEncoded do
  @moduledoc """
  Provides struct and type for a ConfigWebSearchInfoEncoded
  """

  @type t :: %__MODULE__{provider: String.t()}

  defstruct [:provider]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [provider: {:union, [:string, const: "random"]}]
  end
end
