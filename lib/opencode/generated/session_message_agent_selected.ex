defmodule OpenCode.Generated.SessionMessageAgentSelected do
  @moduledoc """
  Provides struct and type for a SessionMessageAgentSelected
  """

  @type t :: %__MODULE__{
          agent: String.t(),
          id: String.t(),
          metadata: map | nil,
          previous: String.t() | nil,
          time: OpenCode.Generated.SessionMessageAgentSelectedTime.t(),
          type: String.t()
        }

  defstruct [:agent, :id, :metadata, :previous, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      agent: :string,
      id: :string,
      metadata: :map,
      previous: :string,
      time: {OpenCode.Generated.SessionMessageAgentSelectedTime, :t},
      type: {:const, "agent-switched"}
    ]
  end
end
