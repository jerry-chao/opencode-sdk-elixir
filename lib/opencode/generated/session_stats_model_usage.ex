defmodule OpenCode.Generated.SessionStatsModelUsage do
  @moduledoc """
  Provides struct and type for a SessionStatsModelUsage
  """

  @type t :: %__MODULE__{
          cost: number,
          model: OpenCode.Generated.ModelRef.t(),
          steps: integer,
          tokens: OpenCode.Generated.TokenUsageInfo.t()
        }

  defstruct [:cost, :model, :steps, :tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cost: :number,
      model: {OpenCode.Generated.ModelRef, :t},
      steps: :integer,
      tokens: {OpenCode.Generated.TokenUsageInfo, :t}
    ]
  end
end
