defmodule OpenCode.Generated.PromptAgentAttachment do
  @moduledoc """
  Provides struct and type for a PromptAgentAttachment
  """

  @type t :: %__MODULE__{mention: OpenCode.Generated.PromptMention.t() | nil, name: String.t()}

  defstruct [:mention, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mention: {OpenCode.Generated.PromptMention, :t}, name: :string]
  end
end
