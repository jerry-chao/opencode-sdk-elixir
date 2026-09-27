defmodule OpenCode.Generated.SessionStatsActivity do
  @moduledoc """
  Provides struct and type for a SessionStatsActivity
  """

  @type t :: %__MODULE__{date: String.t(), steps: integer}

  defstruct [:date, :steps]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: :string, steps: :integer]
  end
end
