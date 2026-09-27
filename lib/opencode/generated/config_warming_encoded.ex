defmodule OpenCode.Generated.ConfigWarmingEncoded do
  @moduledoc """
  Provides struct and type for a ConfigWarmingEncoded
  """

  @type t :: %__MODULE__{
          duration: String.t() | nil,
          interval: String.t() | nil,
          prompt: String.t() | nil
        }

  defstruct [:duration, :interval, :prompt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [duration: :string, interval: :string, prompt: :string]
  end
end
