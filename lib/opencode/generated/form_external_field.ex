defmodule OpenCode.Generated.FormExternalField do
  @moduledoc """
  Provides struct and type for a FormExternalField
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          key: String.t(),
          title: String.t() | nil,
          type: String.t(),
          url: String.t()
        }

  defstruct [:description, :key, :title, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, key: :string, title: :string, type: {:const, "external"}, url: :string]
  end
end
