defmodule OpenCode.Generated.IntegrationNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a IntegrationNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{integration_id: String.t(), message: String.t(), tag: String.t()}

  defstruct [:integration_id, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [integration_id: :string, message: :string, tag: {:const, "IntegrationNotFoundError"}]
  end
end
