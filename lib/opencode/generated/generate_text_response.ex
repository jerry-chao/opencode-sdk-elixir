defmodule OpenCode.Generated.GenerateTextResponse do
  @moduledoc """
  Provides struct and type for a GenerateTextResponse
  """

  @type t :: %__MODULE__{data: OpenCode.Generated.GenerateTextResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenCode.Generated.GenerateTextResponseData, :t}]
  end
end
