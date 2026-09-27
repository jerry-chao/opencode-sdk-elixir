defmodule OpenCode.Generated.CommandInfo do
  @moduledoc """
  Provides struct and type for a CommandInfo
  """

  @type t :: %__MODULE__{description: String.t() | nil, name: String.t()}

  defstruct [:description, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, name: :string]
  end
end
