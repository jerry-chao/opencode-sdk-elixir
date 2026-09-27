defmodule OpenCode.Generated.ServiceUnavailableErrorEncoded do
  @moduledoc """
  Provides struct and type for a ServiceUnavailableErrorEncoded
  """

  @type t :: %__MODULE__{message: String.t(), service: String.t() | nil, tag: String.t()}

  defstruct [:message, :service, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message: :string,
      service: {:union, [:string, :null]},
      tag: {:const, "ServiceUnavailableError"}
    ]
  end
end
