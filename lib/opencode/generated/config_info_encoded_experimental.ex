defmodule OpenCode.Generated.ConfigInfoEncodedExperimental do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedExperimental
  """

  @type t :: %__MODULE__{
          policies: [OpenCode.Generated.ConfigInfoEncodedExperimentalPolicies.t()] | nil,
          portable_shell_scanner: boolean | nil,
          subagent_depth: integer | nil
        }

  defstruct [:policies, :portable_shell_scanner, :subagent_depth]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      policies: [{OpenCode.Generated.ConfigInfoEncodedExperimentalPolicies, :t}],
      portable_shell_scanner: :boolean,
      subagent_depth: :integer
    ]
  end
end
