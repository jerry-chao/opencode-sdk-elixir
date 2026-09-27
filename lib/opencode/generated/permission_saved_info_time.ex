defmodule OpenCode.Generated.PermissionSavedInfoTime do
  @moduledoc """
  Provides struct and type for a PermissionSavedInfoTime
  """

  @type t :: %__MODULE__{created: number, updated: number}

  defstruct [:created, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: :number, updated: :number]
  end
end
