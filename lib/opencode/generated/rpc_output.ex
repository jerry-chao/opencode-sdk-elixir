defmodule OpenCode.Generated.RpcOutput do
  @moduledoc """
  Provides struct and type for a RpcOutput
  """

  @type t :: %__MODULE__{output: map | nil}

  defstruct [:output]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [output: :map]
  end
end
