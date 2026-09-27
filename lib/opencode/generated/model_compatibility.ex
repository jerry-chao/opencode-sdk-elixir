defmodule OpenCode.Generated.ModelCompatibility do
  @moduledoc """
  Provides struct and type for a ModelCompatibility
  """

  @type t :: %__MODULE__{
          max_tokens_field: String.t() | nil,
          reasoning_field: String.t() | nil,
          require_assistant_after_tool: boolean | nil,
          require_finish_reason: boolean | nil,
          require_reasoning: boolean | nil,
          supports_prompt_cache_key: boolean | nil
        }

  defstruct [
    :max_tokens_field,
    :reasoning_field,
    :require_assistant_after_tool,
    :require_finish_reason,
    :require_reasoning,
    :supports_prompt_cache_key
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      max_tokens_field: {:enum, ["max_completion_tokens", "max_tokens"]},
      reasoning_field:
        {:union, [:string, enum: ["reasoning", "reasoning_content", "reasoning_text"]]},
      require_assistant_after_tool: :boolean,
      require_finish_reason: :boolean,
      require_reasoning: :boolean,
      supports_prompt_cache_key: :boolean
    ]
  end
end
