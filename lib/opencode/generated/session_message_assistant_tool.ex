defmodule OpenCode.Generated.SessionMessageAssistantTool do
  @moduledoc """
  Provides struct and type for a SessionMessageAssistantTool
  """

  @type t :: %__MODULE__{
          executed: boolean | nil,
          id: String.t(),
          name: String.t(),
          provider_result_state: map | nil,
          provider_state: map | nil,
          state:
            OpenCode.Generated.SessionMessageToolStateCompleted.t()
            | OpenCode.Generated.SessionMessageToolStateError.t()
            | OpenCode.Generated.SessionMessageToolStateRunning.t()
            | OpenCode.Generated.SessionMessageToolStateStreaming.t(),
          time: OpenCode.Generated.SessionMessageAssistantToolTime.t(),
          type: String.t()
        }

  defstruct [:executed, :id, :name, :provider_result_state, :provider_state, :state, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      executed: :boolean,
      id: :string,
      name: :string,
      provider_result_state: :map,
      provider_state: :map,
      state:
        {:union,
         [
           {OpenCode.Generated.SessionMessageToolStateCompleted, :t},
           {OpenCode.Generated.SessionMessageToolStateError, :t},
           {OpenCode.Generated.SessionMessageToolStateRunning, :t},
           {OpenCode.Generated.SessionMessageToolStateStreaming, :t}
         ]},
      time: {OpenCode.Generated.SessionMessageAssistantToolTime, :t},
      type: {:const, "tool"}
    ]
  end
end
