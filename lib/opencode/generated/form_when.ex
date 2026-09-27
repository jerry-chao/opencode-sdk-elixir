defmodule OpenCode.Generated.FormWhen do
  @moduledoc """
  Provides struct and type for a FormWhen
  """

  @type t :: %__MODULE__{key: String.t(), op: String.t(), value: boolean | number | String.t()}

  defstruct [:key, :op, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      key: :string,
      op: {:enum, ["eq", "neq"]},
      value: {:union, [:boolean, :number, :string, enum: ["Infinity", "-Infinity", "NaN"]]}
    ]
  end
end
