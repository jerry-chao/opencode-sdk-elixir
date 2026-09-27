defmodule OpenCode.Generated.ConfigShellOption do
  @moduledoc """
  Provides struct and type for a ConfigShellOption
  """

  @type t :: %__MODULE__{acceptable: boolean, name: String.t(), path: String.t()}

  defstruct [:acceptable, :name, :path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [acceptable: :boolean, name: :string, path: :string]
  end
end
