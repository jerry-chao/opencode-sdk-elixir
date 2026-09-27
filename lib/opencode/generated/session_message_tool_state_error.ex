defmodule OpenCode.Generated.SessionMessageToolStateError do
  @moduledoc """
  Provides struct and type for a SessionMessageToolStateError
  """

  @type t :: %__MODULE__{
          content:
            [OpenCode.Generated.ToolFileContent.t() | OpenCode.Generated.ToolTextContent.t()]
            | nil,
          error: OpenCode.Generated.SessionStructuredError.t(),
          input: map,
          metadata: map | nil,
          status: String.t()
        }

  defstruct [:content, :error, :input, :metadata, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [
        union: [
          {OpenCode.Generated.ToolFileContent, :t},
          {OpenCode.Generated.ToolTextContent, :t}
        ]
      ],
      error: {OpenCode.Generated.SessionStructuredError, :t},
      input: :map,
      metadata: :map,
      status: {:const, "error"}
    ]
  end
end
