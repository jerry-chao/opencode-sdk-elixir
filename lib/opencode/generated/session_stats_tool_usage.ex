defmodule OpenCode.Generated.SessionStatsToolUsage do
  @moduledoc """
  Provides struct and type for a SessionStatsToolUsage
  """

  @type t :: %__MODULE__{
          calls: integer,
          duration_p50: number | nil,
          failed: integer,
          name: String.t(),
          succeeded: integer,
          unfinished: integer
        }

  defstruct [:calls, :duration_p50, :failed, :name, :succeeded, :unfinished]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      calls: :integer,
      duration_p50: :number,
      failed: :integer,
      name: :string,
      succeeded: :integer,
      unfinished: :integer
    ]
  end
end
