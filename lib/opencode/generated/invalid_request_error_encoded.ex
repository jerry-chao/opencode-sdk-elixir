defmodule OpenCode.Generated.InvalidRequestErrorEncoded do
  @moduledoc """
  Provides struct and type for a InvalidRequestErrorEncoded
  """

  @type t :: %__MODULE__{
          field: String.t() | nil,
          kind: String.t() | nil,
          message: String.t(),
          tag: String.t()
        }

  defstruct [:field, :kind, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      field: {:union, [:string, :null]},
      kind: {:union, [:string, :null]},
      message: :string,
      tag: {:const, "InvalidRequestError"}
    ]
  end
end
