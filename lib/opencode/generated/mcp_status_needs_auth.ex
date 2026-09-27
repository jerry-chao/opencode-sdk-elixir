defmodule OpenCode.Generated.McpStatusNeedsAuth do
  @moduledoc """
  Provides struct and type for a McpStatusNeedsAuth
  """

  @type t :: %__MODULE__{error: String.t(), status: String.t()}

  defstruct [:error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: :string, status: {:const, "needs_auth"}]
  end
end
