defmodule OpenCode.Generated.SessionMessageToolStateCompleted do
  @moduledoc """
  Provides struct and type for a SessionMessageToolStateCompleted
  """

  @type t :: %__MODULE__{
          content: [
            OpenCode.Generated.ToolFileContent.t() | OpenCode.Generated.ToolTextContent.t()
          ],
          input: map,
          metadata: map | nil,
          status: String.t()
        }

  defstruct [:content, :input, :metadata, :status]

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
      input: :map,
      metadata: :map,
      status: {:const, "completed"}
    ]
  end
end
