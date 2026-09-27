defmodule OpenCode.Generated.IntegrationInfo do
  @moduledoc """
  Provides struct and type for a IntegrationInfo
  """

  @type t :: %__MODULE__{
          connections: [
            OpenCode.Generated.ConnectionCredentialInfo.t()
            | OpenCode.Generated.ConnectionEnvInfo.t()
          ],
          id: String.t(),
          metadata: map | nil,
          methods: [
            OpenCode.Generated.IntegrationCommandMethod.t()
            | OpenCode.Generated.IntegrationEnvMethod.t()
            | OpenCode.Generated.IntegrationKeyMethod.t()
            | OpenCode.Generated.IntegrationOAuthMethod.t()
          ],
          name: String.t()
        }

  defstruct [:connections, :id, :metadata, :methods, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      connections: [
        union: [
          {OpenCode.Generated.ConnectionCredentialInfo, :t},
          {OpenCode.Generated.ConnectionEnvInfo, :t}
        ]
      ],
      id: :string,
      metadata: :map,
      methods: [
        union: [
          {OpenCode.Generated.IntegrationCommandMethod, :t},
          {OpenCode.Generated.IntegrationEnvMethod, :t},
          {OpenCode.Generated.IntegrationKeyMethod, :t},
          {OpenCode.Generated.IntegrationOAuthMethod, :t}
        ]
      ],
      name: :string
    ]
  end
end
