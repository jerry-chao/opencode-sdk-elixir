defmodule OpenCode.Generated.PluginInfo do
  @moduledoc """
  Provides struct and type for a PluginInfo
  """

  @type t :: %__MODULE__{
          features: OpenCode.Generated.PluginFeatures.t(),
          id: String.t() | nil,
          source: OpenCode.Generated.PluginInfoSource.t(),
          state: OpenCode.Generated.PluginInfoState.t()
        }

  defstruct [:features, :id, :source, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      features: {OpenCode.Generated.PluginFeatures, :t},
      id: :string,
      source: {OpenCode.Generated.PluginInfoSource, :t},
      state: {OpenCode.Generated.PluginInfoState, :t}
    ]
  end
end
