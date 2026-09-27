defmodule OpenCode.Generated.McpServerNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a McpServerNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{message: String.t(), server: String.t(), tag: String.t()}

  defstruct [:message, :server, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, server: :string, tag: {:const, "McpServerNotFoundError"}]
  end
end
