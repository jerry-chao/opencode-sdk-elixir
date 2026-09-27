defmodule OpenCode.Generated.WebSearchResult do
  @moduledoc """
  Provides struct and type for a WebSearchResult
  """

  @type t :: %__MODULE__{
          content: String.t() | nil,
          time: OpenCode.Generated.WebSearchResultTime.t(),
          title: String.t() | nil,
          url: String.t()
        }

  defstruct [:content, :time, :title, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: :string,
      time: {OpenCode.Generated.WebSearchResultTime, :t},
      title: :string,
      url: :string
    ]
  end
end
