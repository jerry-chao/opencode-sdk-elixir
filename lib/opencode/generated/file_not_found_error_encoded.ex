defmodule OpenCode.Generated.FileNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a FileNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{message: String.t(), path: String.t(), tag: String.t()}

  defstruct [:message, :path, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, path: :string, tag: {:const, "FileNotFoundError"}]
  end
end
