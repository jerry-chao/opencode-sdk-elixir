defmodule OpenCode.Generated.SessionMessagesResponseCursor do
  @moduledoc """
  Provides struct and type for a SessionMessagesResponseCursor
  """

  @type t :: %__MODULE__{next: String.t() | nil, previous: String.t() | nil}

  defstruct [:next, :previous]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [next: {:union, [:string, :null]}, previous: {:union, [:string, :null]}]
  end
end
