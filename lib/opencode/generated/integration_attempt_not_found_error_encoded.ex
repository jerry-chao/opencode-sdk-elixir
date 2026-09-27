defmodule OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a IntegrationAttemptNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{
          attempt_id: String.t(),
          integration_id: String.t(),
          message: String.t(),
          tag: String.t()
        }

  defstruct [:attempt_id, :integration_id, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attempt_id: :string,
      integration_id: :string,
      message: :string,
      tag: {:const, "IntegrationAttemptNotFoundError"}
    ]
  end
end
