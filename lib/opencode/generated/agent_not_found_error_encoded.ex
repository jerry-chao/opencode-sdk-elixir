defmodule OpenCode.Generated.AgentNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a AgentNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{agent_id: String.t(), message: String.t(), tag: String.t()}

  defstruct [:agent_id, :message, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [agent_id: :string, message: :string, tag: {:const, "AgentNotFoundError"}]
  end
end
