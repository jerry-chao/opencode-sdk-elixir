defmodule OpenCode.Generated.ConfigDocumentEncoded do
  @moduledoc """
  Provides struct and type for a ConfigDocumentEncoded
  """

  @type t :: %__MODULE__{
          info: OpenCode.Generated.ConfigInfoEncoded.t(),
          path: String.t() | nil,
          type: String.t()
        }

  defstruct [:info, :path, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [info: {OpenCode.Generated.ConfigInfoEncoded, :t}, path: :string, type: {:const, "document"}]
  end
end
