defmodule OpenCode.Generated.FormNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a FormNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{id: String.t(), message: String.t(), tag: String.t()}

  defstruct [:id, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, message: :string, tag: {:const, "FormNotFoundError"}]
  end
end
