defmodule OpenCode.Generated.SessionStatsInfoTools do
  @moduledoc """
  Provides struct and types for a SessionStatsInfoTools
  """

  @type t :: %__MODULE__{
          mode: String.t(),
          totals: OpenCode.Generated.SessionStatsToolTotals.t(),
          usage: [OpenCode.Generated.SessionStatsToolUsage.t()]
        }

  defstruct [:mode, :totals, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      mode: {:enum, ["detail", "none", "summary"]},
      totals: {OpenCode.Generated.SessionStatsToolTotals, :t},
      usage: [{OpenCode.Generated.SessionStatsToolUsage, :t}]
    ]
  end
end
