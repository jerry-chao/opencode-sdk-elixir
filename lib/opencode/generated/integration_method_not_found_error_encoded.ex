defmodule OpenCode.Generated.IntegrationMethodNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a IntegrationMethodNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{
          integration_id: String.t(),
          message: String.t(),
          method_id: String.t(),
          tag: String.t()
        }

  defstruct [:integration_id, :message, :method_id, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      integration_id: :string,
      message: :string,
      method_id: :string,
      tag: {:const, "IntegrationMethodNotFoundError"}
    ]
  end
end
