defmodule OpenCode.Generated.WebSearchResponseEncoded do
  @moduledoc """
  Provides struct and type for a WebSearchResponseEncoded
  """

  @type t :: %__MODULE__{
          provider_id: String.t(),
          results: [OpenCode.Generated.WebSearchResult.t()]
        }

  defstruct [:provider_id, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [provider_id: :string, results: [{OpenCode.Generated.WebSearchResult, :t}]]
  end
end
