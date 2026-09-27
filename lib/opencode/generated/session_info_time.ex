defmodule OpenCode.Generated.SessionInfoTime do
  @moduledoc """
  Provides struct and type for a SessionInfoTime
  """

  @type t :: %__MODULE__{
          archived: number | nil,
          created: number,
          idle: number | nil,
          updated: number,
          viewed: number | nil
        }

  defstruct [:archived, :created, :idle, :updated, :viewed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [archived: :number, created: :number, idle: :number, updated: :number, viewed: :number]
  end
end
