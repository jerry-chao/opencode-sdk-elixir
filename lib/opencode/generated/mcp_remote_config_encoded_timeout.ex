defmodule OpenCode.Generated.McpRemoteConfigEncodedTimeout do
  @moduledoc """
  Provides struct and type for a McpRemoteConfigEncodedTimeout
  """

  @type t :: %__MODULE__{catalog: integer | nil, execution: integer | nil, startup: integer | nil}

  defstruct [:catalog, :execution, :startup]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [catalog: :integer, execution: :integer, startup: :integer]
  end
end
