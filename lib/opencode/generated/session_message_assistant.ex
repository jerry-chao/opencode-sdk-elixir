defmodule OpenCode.Generated.SessionMessageAssistant do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistant
  """

  @type t :: %__MODULE__{
          agent: String.t(),
          content: [
            OpenCode.Generated.SessionMessageAssistantReasoning.t()
            | OpenCode.Generated.SessionMessageAssistantText.t()
            | OpenCode.Generated.SessionMessageAssistantTool.t()
          ],
          cost: number | nil,
          error: OpenCode.Generated.SessionStructuredError.t() | nil,
          finish: String.t() | nil,
          id: String.t(),
          metadata: map | nil,
          model: OpenCode.Generated.ModelRef.t(),
          provider_state: map | nil,
          raw_finish: String.t() | nil,
          retry: OpenCode.Generated.SessionMessageAssistantRetry.t() | nil,
          snapshot: OpenCode.Generated.SessionMessageAssistantSnapshot.t() | nil,
          time: OpenCode.Generated.SessionMessageAssistantTime.t(),
          tokens: OpenCode.Generated.TokenUsageInfo.t() | nil,
          type: String.t()
        }

  defstruct [
    :agent,
    :content,
    :cost,
    :error,
    :finish,
    :id,
    :metadata,
    :model,
    :provider_state,
    :raw_finish,
    :retry,
    :snapshot,
    :time,
    :tokens,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      agent: :string,
      content: [
        union: [
          {OpenCode.Generated.SessionMessageAssistantReasoning, :t},
          {OpenCode.Generated.SessionMessageAssistantText, :t},
          {OpenCode.Generated.SessionMessageAssistantTool, :t}
        ]
      ],
      cost: :number,
      error: {OpenCode.Generated.SessionStructuredError, :t},
      finish: {:enum, ["stop", "length", "tool-calls", "content-filter", "error", "unknown"]},
      id: :string,
      metadata: :map,
      model: {OpenCode.Generated.ModelRef, :t},
      provider_state: :map,
      raw_finish: :string,
      retry: {OpenCode.Generated.SessionMessageAssistantRetry, :t},
      snapshot: {OpenCode.Generated.SessionMessageAssistantSnapshot, :t},
      time: {OpenCode.Generated.SessionMessageAssistantTime, :t},
      tokens: {OpenCode.Generated.TokenUsageInfo, :t},
      type: {:const, "assistant"}
    ]
  end
end
