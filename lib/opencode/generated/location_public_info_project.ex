defmodule OpenCode.Generated.LocationPublicInfoProject do
  @moduledoc """
  Provides struct and type for a LocationPublicInfoProject
  """

  @type t :: %__MODULE__{canonical: String.t(), directory: String.t(), id: String.t()}

  defstruct [:canonical, :directory, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [canonical: :string, directory: :string, id: :string]
  end
end
