defmodule OpenCode.Generated.McpServer do
  @moduledoc """
  Provides struct and type for a McpServer
  """

  @type t :: %__MODULE__{
          integration_id: String.t() | nil,
          name: String.t(),
          status:
            OpenCode.Generated.McpStatusConnected.t()
            | OpenCode.Generated.McpStatusDisabled.t()
            | OpenCode.Generated.McpStatusFailed.t()
            | OpenCode.Generated.McpStatusNeedsAuth.t()
            | OpenCode.Generated.McpStatusPending.t()
        }

  defstruct [:integration_id, :name, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      integration_id: :string,
      name: :string,
      status:
        {:union,
         [
           {OpenCode.Generated.McpStatusConnected, :t},
           {OpenCode.Generated.McpStatusDisabled, :t},
           {OpenCode.Generated.McpStatusFailed, :t},
           {OpenCode.Generated.McpStatusNeedsAuth, :t},
           {OpenCode.Generated.McpStatusPending, :t}
         ]}
    ]
  end
end
