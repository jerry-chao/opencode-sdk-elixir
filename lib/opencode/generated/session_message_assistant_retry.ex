defmodule OpenCode.Generated.SessionMessageAssistantRetry do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistantRetry
  """

  @type t :: %__MODULE__{
          at: number,
          attempt: integer,
          error: OpenCode.Generated.SessionStructuredError.t()
        }

  defstruct [:at, :attempt, :error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [at: :number, attempt: :integer, error: {OpenCode.Generated.SessionStructuredError, :t}]
  end
end
