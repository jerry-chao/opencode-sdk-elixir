defmodule OpenCode.Generated.SessionStatsInfo do
  @moduledoc """
  Provides struct and type for a SessionStatsInfo
  """

  @type t :: %__MODULE__{
          active_days: integer,
          activity: [OpenCode.Generated.SessionStatsActivity.t()],
          cost: number,
          models: [OpenCode.Generated.SessionStatsModelUsage.t()],
          prompts: integer,
          range: OpenCode.Generated.SessionStatsInfoRange.t(),
          sessions: integer,
          steps: integer,
          streak: integer,
          subagents: integer,
          tokens: OpenCode.Generated.TokenUsageInfo.t(),
          tools: OpenCode.Generated.SessionStatsInfoTools.t()
        }

  defstruct [
    :active_days,
    :activity,
    :cost,
    :models,
    :prompts,
    :range,
    :sessions,
    :steps,
    :streak,
    :subagents,
    :tokens,
    :tools
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_days: :integer,
      activity: [{OpenCode.Generated.SessionStatsActivity, :t}],
      cost: :number,
      models: [{OpenCode.Generated.SessionStatsModelUsage, :t}],
      prompts: :integer,
      range: {OpenCode.Generated.SessionStatsInfoRange, :t},
      sessions: :integer,
      steps: :integer,
      streak: :integer,
      subagents: :integer,
      tokens: {OpenCode.Generated.TokenUsageInfo, :t},
      tools: {OpenCode.Generated.SessionStatsInfoTools, :t}
    ]
  end
end
