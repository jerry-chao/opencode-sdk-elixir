defmodule OpenCode.Generated.SessionMessageAssistantTime do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistantTime
  """

  @type t :: %__MODULE__{completed: number | nil, created: number, streamed: number | nil}

  defstruct [:completed, :created, :streamed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [completed: :number, created: :number, streamed: :number]
  end
end
