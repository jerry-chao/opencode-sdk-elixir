defmodule OpenCode.Generated.PromptFileAttachmentSource do
  @moduledoc """
  Provides struct and types for a PromptFileAttachmentSource
  """

  @type t :: %__MODULE__{type: String.t(), uri: String.t()}

  defstruct [:type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["inline", "uri"]}, uri: :string]
  end
end
