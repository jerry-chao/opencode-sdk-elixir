defmodule OpenCode.Generated.PluginInfoSource do
  @moduledoc """
  Provides struct and types for a PluginInfoSource
  """

  @type t :: %__MODULE__{
          outdated: true | nil,
          path: String.t(),
          target: String.t(),
          type: String.t(),
          updating: true | nil,
          version: String.t() | nil
        }

  defstruct [:outdated, :path, :target, :type, :updating, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      outdated: {:const, true},
      path: :string,
      target: :string,
      type: {:enum, ["builtin", "local", "package", "sdk"]},
      updating: {:const, true},
      version: :string
    ]
  end
end
