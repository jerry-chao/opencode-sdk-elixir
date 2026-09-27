defmodule OpenCode.Generated.CommandExecutionErrorEncoded do
  @moduledoc """
  Provides struct and type for a CommandExecutionErrorEncoded
  """

  @type t :: %__MODULE__{command: String.t(), message: String.t(), tag: String.t()}

  defstruct [:command, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [command: :string, message: :string, tag: {:const, "CommandExecutionError"}]
  end
end
