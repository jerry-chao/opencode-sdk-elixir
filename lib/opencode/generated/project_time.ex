defmodule OpenCode.Generated.ProjectTime do
  @moduledoc """
  Provides struct and type for a ProjectTime
  """

  @type t :: %__MODULE__{active: integer, created: integer, updated: integer}

  defstruct [:active, :created, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [active: :integer, created: :integer, updated: :integer]
  end
end
