defmodule OpenCode.Generated.McpLocalConfigEncoded do
  @moduledoc """
  Provides struct and type for a McpLocalConfigEncoded
  """

  @type t :: %__MODULE__{
          codemode: boolean | nil,
          command: [String.t()],
          cwd: String.t() | nil,
          disabled: boolean | nil,
          environment: map | nil,
          protocol: String.t() | nil,
          timeout: OpenCode.Generated.McpLocalConfigEncodedTimeout.t() | nil,
          type: String.t()
        }

  defstruct [:codemode, :command, :cwd, :disabled, :environment, :protocol, :timeout, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      codemode: :boolean,
      command: [:string],
      cwd: :string,
      disabled: :boolean,
      environment: :map,
      protocol: {:enum, ["legacy", "auto", "2026-07-28"]},
      timeout: {OpenCode.Generated.McpLocalConfigEncodedTimeout, :t},
      type: {:const, "local"}
    ]
  end
end
