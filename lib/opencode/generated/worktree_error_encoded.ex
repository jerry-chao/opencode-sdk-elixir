defmodule OpenCode.Generated.WorktreeErrorEncoded do
  @moduledoc """
  Provides struct and type for a WorktreeErrorEncoded
  """

  @type t :: %__MODULE__{data: OpenCode.Generated.WorktreeErrorEncodedData.t(), name: String.t()}

  defstruct [:data, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenCode.Generated.WorktreeErrorEncodedData, :t}, name: {:const, "WorktreeError"}]
  end
end
