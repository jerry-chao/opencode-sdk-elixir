defmodule OpenCode.Generated.FormDetailState do
  @moduledoc """
  Provides struct and types for a FormDetailState
  """

  @type t :: %__MODULE__{answer: map, status: String.t()}

  defstruct [:answer, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [answer: :map, status: {:enum, ["answered", "cancelled", "pending"]}]
  end
end
