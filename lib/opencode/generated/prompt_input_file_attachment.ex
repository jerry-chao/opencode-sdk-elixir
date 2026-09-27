defmodule OpenCode.Generated.PromptInputFileAttachment do
  @moduledoc """
  Provides struct and type for a PromptInputFileAttachment
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          mention: OpenCode.Generated.PromptMention.t() | nil,
          name: String.t() | nil,
          uri: String.t()
        }

  defstruct [:description, :mention, :name, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      mention: {OpenCode.Generated.PromptMention, :t},
      name: :string,
      uri: :string
    ]
  end
end
