defmodule OpenCode.Generated.SessionTransferData do
  @moduledoc """
  Provides struct and type for a SessionTransferData
  """

  @type t :: %__MODULE__{
          info: OpenCode.Generated.SessionInfo.t(),
          messages: [
            map
            | OpenCode.Generated.SessionMessageAgentSelected.t()
            | OpenCode.Generated.SessionMessageAssistant.t()
            | OpenCode.Generated.SessionMessageIdle.t()
            | OpenCode.Generated.SessionMessageLocationSwitched.t()
            | OpenCode.Generated.SessionMessageModelSelected.t()
            | OpenCode.Generated.SessionMessageShell.t()
            | OpenCode.Generated.SessionMessageSkill.t()
            | OpenCode.Generated.SessionMessageSynthetic.t()
            | OpenCode.Generated.SessionMessageSystem.t()
            | OpenCode.Generated.SessionMessageUser.t()
          ]
        }

  defstruct [:info, :messages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      info: {OpenCode.Generated.SessionInfo, :t},
      messages: [
        union: [
          :map,
          {OpenCode.Generated.SessionMessageAgentSelected, :t},
          {OpenCode.Generated.SessionMessageAssistant, :t},
          {OpenCode.Generated.SessionMessageIdle, :t},
          {OpenCode.Generated.SessionMessageLocationSwitched, :t},
          {OpenCode.Generated.SessionMessageModelSelected, :t},
          {OpenCode.Generated.SessionMessageShell, :t},
          {OpenCode.Generated.SessionMessageSkill, :t},
          {OpenCode.Generated.SessionMessageSynthetic, :t},
          {OpenCode.Generated.SessionMessageSystem, :t},
          {OpenCode.Generated.SessionMessageUser, :t}
        ]
      ]
    ]
  end
end
