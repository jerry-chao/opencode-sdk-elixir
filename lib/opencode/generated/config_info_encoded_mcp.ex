defmodule OpenCode.Generated.ConfigInfoEncodedMcp do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedMcp
  """

  @type t :: %__MODULE__{
          servers: map | nil,
          timeout: OpenCode.Generated.ConfigInfoEncodedMcpTimeout.t() | nil
        }

  defstruct [:servers, :timeout]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [servers: :map, timeout: {OpenCode.Generated.ConfigInfoEncodedMcpTimeout, :t}]
  end
end
