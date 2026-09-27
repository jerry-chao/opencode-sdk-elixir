defmodule OpenCode.Generated.PromptInputSkillAttachment do
  @moduledoc """
  Provides struct and type for a PromptInputSkillAttachment
  """

  @type t :: %__MODULE__{id: String.t(), mention: OpenCode.Generated.PromptMention.t() | nil}

  defstruct [:id, :mention]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, mention: {OpenCode.Generated.PromptMention, :t}]
  end
end
