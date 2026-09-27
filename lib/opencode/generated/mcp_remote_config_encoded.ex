defmodule OpenCode.Generated.McpRemoteConfigEncoded do
  @moduledoc """
  Provides struct and type for a McpRemoteConfigEncoded
  """

  @type t :: %__MODULE__{
          codemode: boolean | nil,
          disabled: boolean | nil,
          headers: map | nil,
          oauth: false | OpenCode.Generated.McpOAuthConfigEncoded.t() | nil,
          protocol: String.t() | nil,
          timeout: OpenCode.Generated.McpRemoteConfigEncodedTimeout.t() | nil,
          type: String.t(),
          url: String.t()
        }

  defstruct [:codemode, :disabled, :headers, :oauth, :protocol, :timeout, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      codemode: :boolean,
      disabled: :boolean,
      headers: :map,
      oauth: {:union, [{OpenCode.Generated.McpOAuthConfigEncoded, :t}, const: false]},
      protocol: {:enum, ["legacy", "auto", "2026-07-28"]},
      timeout: {OpenCode.Generated.McpRemoteConfigEncodedTimeout, :t},
      type: {:const, "remote"},
      url: :string
    ]
  end
end
