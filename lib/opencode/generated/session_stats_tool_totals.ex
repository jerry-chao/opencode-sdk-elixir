defmodule OpenCode.Generated.SessionStatsToolTotals do
  @moduledoc """
  Provides struct and type for a SessionStatsToolTotals
  """

  @type t :: %__MODULE__{calls: integer, failed: integer, succeeded: integer, unfinished: integer}

  defstruct [:calls, :failed, :succeeded, :unfinished]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [calls: :integer, failed: :integer, succeeded: :integer, unfinished: :integer]
  end
end
