defmodule OpenCode.Generated.ConfigInfoEncoded do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncoded
  """

  @type t :: %__MODULE__{
          agents: map | nil,
          commands: map | nil,
          compaction: OpenCode.Generated.ConfigInfoEncodedCompaction.t() | nil,
          default_agent: String.t() | nil,
          enterprise: OpenCode.Generated.ConfigInfoEncodedEnterprise.t() | nil,
          experimental: OpenCode.Generated.ConfigInfoEncodedExperimental.t() | nil,
          formatter: boolean | map | nil,
          instructions: [String.t()] | nil,
          lsp: boolean | map | nil,
          mcp: OpenCode.Generated.ConfigInfoEncodedMcp.t() | nil,
          media: OpenCode.Generated.ConfigInfoEncodedMedia.t() | nil,
          model: OpenCode.Generated.ConfigInfoEncodedModel.t() | String.t() | nil,
          permissions: [OpenCode.Generated.PermissionRule.t()] | nil,
          plugins: [OpenCode.Generated.ConfigPluginEntryEncoded.t() | String.t()] | nil,
          providers: map | nil,
          references: map | nil,
          schema: String.t() | nil,
          share: String.t() | nil,
          shell: String.t() | nil,
          skills: [String.t()] | nil,
          snapshots: boolean | nil,
          tool_output: OpenCode.Generated.ConfigInfoEncodedToolOutput.t() | nil,
          update: String.t() | nil,
          username: String.t() | nil,
          warming: boolean | OpenCode.Generated.ConfigWarmingEncoded.t() | nil,
          watcher: OpenCode.Generated.ConfigInfoEncodedWatcher.t() | nil,
          websearch: false | OpenCode.Generated.ConfigWebSearchInfoEncoded.t() | nil,
          worktree: OpenCode.Generated.ConfigWorktree.t() | nil
        }

  defstruct [
    :agents,
    :commands,
    :compaction,
    :default_agent,
    :enterprise,
    :experimental,
    :formatter,
    :instructions,
    :lsp,
    :mcp,
    :media,
    :model,
    :permissions,
    :plugins,
    :providers,
    :references,
    :schema,
    :share,
    :shell,
    :skills,
    :snapshots,
    :tool_output,
    :update,
    :username,
    :warming,
    :watcher,
    :websearch,
    :worktree
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      agents: :map,
      commands: :map,
      compaction: {OpenCode.Generated.ConfigInfoEncodedCompaction, :t},
      default_agent: :string,
      enterprise: {OpenCode.Generated.ConfigInfoEncodedEnterprise, :t},
      experimental: {OpenCode.Generated.ConfigInfoEncodedExperimental, :t},
      formatter: {:union, [:boolean, :map]},
      instructions: [:string],
      lsp: {:union, [:boolean, :map]},
      mcp: {OpenCode.Generated.ConfigInfoEncodedMcp, :t},
      media: {OpenCode.Generated.ConfigInfoEncodedMedia, :t},
      model: {:union, [:string, {OpenCode.Generated.ConfigInfoEncodedModel, :t}]},
      permissions: [{OpenCode.Generated.PermissionRule, :t}],
      plugins: [union: [:string, {OpenCode.Generated.ConfigPluginEntryEncoded, :t}]],
      providers: :map,
      references: :map,
      schema: :string,
      share: {:enum, ["manual", "auto", "disabled"]},
      shell: :string,
      skills: [:string],
      snapshots: :boolean,
      tool_output: {OpenCode.Generated.ConfigInfoEncodedToolOutput, :t},
      update: {:enum, ["disable", "notify", "auto"]},
      username: :string,
      warming: {:union, [:boolean, {OpenCode.Generated.ConfigWarmingEncoded, :t}]},
      watcher: {OpenCode.Generated.ConfigInfoEncodedWatcher, :t},
      websearch: {:union, [{OpenCode.Generated.ConfigWebSearchInfoEncoded, :t}, const: false]},
      worktree: {OpenCode.Generated.ConfigWorktree, :t}
    ]
  end
end
