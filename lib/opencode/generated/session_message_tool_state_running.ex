defmodule OpenCode.Generated.SessionMessageToolStateRunning do
  @moduledoc """
  Provides struct and type for a SessionMessageToolStateRunning
  """

  @type t :: %__MODULE__{input: map, metadata: map, status: String.t()}

  defstruct [:input, :metadata, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [input: :map, metadata: :map, status: {:const, "running"}]
  end
end
