defmodule OpenCode.Generated.SessionMessagesResponse do
  @moduledoc """
  Provides struct and type for a SessionMessagesResponse
  """

  @type t :: %__MODULE__{
          cursor: OpenCode.Generated.SessionMessagesResponseCursor.t(),
          data: [
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

  defstruct [:cursor, :data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cursor: {OpenCode.Generated.SessionMessagesResponseCursor, :t},
      data: [
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
