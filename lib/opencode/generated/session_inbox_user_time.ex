defmodule OpenCode.Generated.SessionInboxUserTime do
  @moduledoc """
  Provides struct and type for a SessionInboxUserTime
  """

  @type t :: %__MODULE__{created: number}

  defstruct [:created]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: :number]
  end
end
