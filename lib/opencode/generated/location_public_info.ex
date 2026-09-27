defmodule OpenCode.Generated.LocationPublicInfo do
  @moduledoc """
  Provides struct and type for a LocationPublicInfo
  """

  @type t :: %__MODULE__{
          directory: String.t(),
          project: OpenCode.Generated.LocationPublicInfoProject.t()
        }

  defstruct [:directory, :project]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [directory: :string, project: {OpenCode.Generated.LocationPublicInfoProject, :t}]
  end
end
