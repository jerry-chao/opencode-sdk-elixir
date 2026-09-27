defmodule OpenCode.Generated.PluginFeatures do
  @moduledoc """
  Provides struct and type for a PluginFeatures
  """

  @type t :: %__MODULE__{rpc: true | nil, server: true | nil, tui: true | nil}

  defstruct [:rpc, :server, :tui]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rpc: {:const, true}, server: {:const, true}, tui: {:const, true}]
  end
end
