defmodule OpenCode.Generated.SessionInfoForkBoundary do
  @moduledoc """
  Provides struct and types for a SessionInfoForkBoundary
  """

  @type t :: %__MODULE__{message_id: String.t(), type: String.t()}

  defstruct [:message_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message_id: :string, type: {:enum, ["before", "through"]}]
  end
end
