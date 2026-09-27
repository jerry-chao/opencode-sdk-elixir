defmodule OpenCode.Generated.ServerInfoPaths do
  @moduledoc """
  Provides struct and type for a ServerInfoPaths
  """

  @type t :: %__MODULE__{tmp: String.t()}

  defstruct [:tmp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tmp: :string]
  end
end
