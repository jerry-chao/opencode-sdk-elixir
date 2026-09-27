defmodule OpenCode.Generated.FormReply do
  @moduledoc """
  Provides struct and type for a FormReply
  """

  @type t :: %__MODULE__{answer: map}

  defstruct [:answer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [answer: :map]
  end
end
