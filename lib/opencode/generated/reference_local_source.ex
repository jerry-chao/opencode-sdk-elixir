defmodule OpenCode.Generated.ReferenceLocalSource do
  @moduledoc """
  Provides struct and type for a ReferenceLocalSource
  """

  @type t :: %__MODULE__{path: String.t(), type: String.t()}

  defstruct [:path, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [path: :string, type: {:const, "local"}]
  end
end
