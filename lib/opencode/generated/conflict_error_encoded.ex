defmodule OpenCode.Generated.ConflictErrorEncoded do
  @moduledoc """
  Provides struct and type for a ConflictErrorEncoded
  """

  @type t :: %__MODULE__{message: String.t(), resource: String.t() | nil, tag: String.t()}

  defstruct [:message, :resource, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, resource: {:union, [:string, :null]}, tag: {:const, "ConflictError"}]
  end
end
