defmodule OpenCode.Generated.ConfigInfoEncodedExperimentalPolicies do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedExperimentalPolicies
  """

  @type t :: %__MODULE__{action: String.t(), effect: String.t(), resource: String.t()}

  defstruct [:action, :effect, :resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:enum, ["provider.use", "permission"]},
      effect: {:enum, ["allow", "deny"]},
      resource: :string
    ]
  end
end
