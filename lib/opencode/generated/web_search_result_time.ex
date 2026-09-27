defmodule OpenCode.Generated.WebSearchResultTime do
  @moduledoc """
  Provides struct and type for a WebSearchResultTime
  """

  @type t :: %__MODULE__{published: number | nil}

  defstruct [:published]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [published: :number]
  end
end
