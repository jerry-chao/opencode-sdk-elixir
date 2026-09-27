defmodule OpenCode.Generated.FileSystemWrite do
  @moduledoc """
  Provides struct and type for a FileSystemWrite
  """

  @type t :: %__MODULE__{path: String.t()}

  defstruct [:path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [path: :string]
  end
end
