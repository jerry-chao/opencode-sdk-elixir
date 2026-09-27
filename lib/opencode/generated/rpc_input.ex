defmodule OpenCode.Generated.RpcInput do
  @moduledoc """
  Provides struct and type for a RpcInput
  """

  @type t :: %__MODULE__{input: map | nil}

  defstruct [:input]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [input: :map]
  end
end
