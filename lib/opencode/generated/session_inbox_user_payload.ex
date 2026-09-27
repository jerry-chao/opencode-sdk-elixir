defmodule OpenCode.Generated.SessionInboxUserPayload do
  @moduledoc """
  Provides struct and type for a SessionInboxUserPayload
  """

  @type t :: %__MODULE__{
          agents: [OpenCode.Generated.PromptAgentAttachment.t()] | nil,
          files: [OpenCode.Generated.PromptFileAttachment.t()] | nil,
          metadata: map | nil,
          skills: [OpenCode.Generated.PromptSkillAttachment.t()] | nil,
          text: String.t()
        }

  defstruct [:agents, :files, :metadata, :skills, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      agents: [{OpenCode.Generated.PromptAgentAttachment, :t}],
      files: [{OpenCode.Generated.PromptFileAttachment, :t}],
      metadata: :map,
      skills: [{OpenCode.Generated.PromptSkillAttachment, :t}],
      text: :string
    ]
  end
end
