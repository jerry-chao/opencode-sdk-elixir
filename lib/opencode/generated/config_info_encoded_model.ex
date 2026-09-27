defmodule OpenCode.Generated.ConfigInfoEncodedModel do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedModel
  """

  @type t :: %__MODULE__{model: String.t(), provider_id: String.t(), variant: String.t() | nil}

  defstruct [:model, :provider_id, :variant]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [model: :string, provider_id: :string, variant: :string]
  end
end
