defmodule OpenCode.Generated.IntegrationCommandAttempt do
  @moduledoc """
  Provides struct and type for a IntegrationCommandAttempt
  """

  @type t :: %__MODULE__{
          attempt_id: String.t(),
          time: OpenCode.Generated.IntegrationCommandAttemptTime.t()
        }

  defstruct [:attempt_id, :time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attempt_id: :string, time: {OpenCode.Generated.IntegrationCommandAttemptTime, :t}]
  end
end
