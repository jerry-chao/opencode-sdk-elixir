defmodule OpenCode.Generated.AgentInfo do
  @moduledoc """
  Provides struct and type for a AgentInfo
  """

  @type t :: %__MODULE__{
          color: String.t() | nil,
          description: String.t() | nil,
          hidden: boolean,
          id: String.t(),
          mode: String.t(),
          model: OpenCode.Generated.ModelRef.t() | nil,
          name: String.t(),
          permissions: [OpenCode.Generated.PermissionRule.t()],
          request: OpenCode.Generated.ProviderRequest.t(),
          steps: integer | nil,
          system: String.t() | nil
        }

  defstruct [
    :color,
    :description,
    :hidden,
    :id,
    :mode,
    :model,
    :name,
    :permissions,
    :request,
    :steps,
    :system
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: :string,
      description: :string,
      hidden: :boolean,
      id: :string,
      mode: {:enum, ["subagent", "primary", "all"]},
      model: {OpenCode.Generated.ModelRef, :t},
      name: :string,
      permissions: [{OpenCode.Generated.PermissionRule, :t}],
      request: {OpenCode.Generated.ProviderRequest, :t},
      steps: :integer,
      system: :string
    ]
  end
end
