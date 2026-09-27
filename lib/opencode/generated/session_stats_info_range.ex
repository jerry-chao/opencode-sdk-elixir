defmodule OpenCode.Generated.SessionStatsInfoRange do
  @moduledoc """
  Provides struct and type for a SessionStatsInfoRange
  """

  @type t :: %__MODULE__{from: number, to: number}

  defstruct [:from, :to]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [from: :number, to: :number]
  end
end
