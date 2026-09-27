defmodule OpenCode.Generated.SessionMessageAssistantToolTime do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistantToolTime
  """

  @type t :: %__MODULE__{completed: number | nil, created: number, ran: number | nil}

  defstruct [:completed, :created, :ran]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [completed: :number, created: :number, ran: :number]
  end
end
