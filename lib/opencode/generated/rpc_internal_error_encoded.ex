defmodule OpenCode.Generated.RpcInternalErrorEncoded do
  @moduledoc """
  Provides struct and type for a RpcInternalErrorEncoded
  """

  @type t :: %__MODULE__{data: map | nil, message: String.t(), tag: String.t(), type: String.t()}

  defstruct [:data, :message, :tag, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {:union, [:map, :null]},
      message: :string,
      tag: {:const, "RpcInternalError"},
      type: {:enum, ["rpc.internal", "rpc.invalid_output"]}
    ]
  end
end
