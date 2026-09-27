defmodule OpenCode.Generated.SessionMessageShellOutput do
  @moduledoc """
  Provides struct and type for a SessionMessageShellOutput
  """

  @type t :: %__MODULE__{cursor: integer, output: String.t(), size: integer, truncated: boolean}

  defstruct [:cursor, :output, :size, :truncated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cursor: :integer, output: :string, size: :integer, truncated: :boolean]
  end
end
