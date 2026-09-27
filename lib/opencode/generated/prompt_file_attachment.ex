defmodule OpenCode.Generated.PromptFileAttachment do
  @moduledoc """
  Provides struct and type for a PromptFileAttachment
  """

  @type t :: %__MODULE__{
          data: String.t(),
          description: String.t() | nil,
          mention: OpenCode.Generated.PromptMention.t() | nil,
          mime: String.t(),
          name: String.t() | nil,
          source: OpenCode.Generated.PromptFileAttachmentSource.t()
        }

  defstruct [:data, :description, :mention, :mime, :name, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :string,
      description: :string,
      mention: {OpenCode.Generated.PromptMention, :t},
      mime: :string,
      name: :string,
      source: {OpenCode.Generated.PromptFileAttachmentSource, :t}
    ]
  end
end
