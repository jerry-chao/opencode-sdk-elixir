defmodule OpenCode.Generated.ConfigPluginEntryEncoded do
  @moduledoc """
  Provides struct and type for a ConfigPluginEntryEncoded
  """

  @type t :: %__MODULE__{options: map | nil, package: String.t()}

  defstruct [:options, :package]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [options: :map, package: :string]
  end
end
