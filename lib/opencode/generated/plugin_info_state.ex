defmodule OpenCode.Generated.PluginInfoState do
  @moduledoc """
  Provides struct and types for a PluginInfoState
  """

  @type t :: %__MODULE__{error: String.t(), ref: String.t() | nil, status: String.t()}

  defstruct [:error, :ref, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: :string, ref: :string, status: {:enum, ["active", "failed"]}]
  end
end
