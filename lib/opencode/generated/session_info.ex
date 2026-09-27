defmodule OpenCode.Generated.SessionInfo do
  @moduledoc """
  Provides struct and type for a SessionInfo
  """

  @type t :: %__MODULE__{
          agent: String.t() | nil,
          cost: number,
          fork: OpenCode.Generated.SessionInfoFork.t() | nil,
          id: String.t(),
          location: OpenCode.Generated.LocationPublicRef.t(),
          metadata: map | nil,
          model: OpenCode.Generated.ModelRef.t() | nil,
          outcome: String.t() | nil,
          parent_id: String.t() | nil,
          permissions: [OpenCode.Generated.PermissionRule.t()] | nil,
          project_id: String.t(),
          revert: OpenCode.Generated.SessionRevert.t() | nil,
          subpath: String.t() | nil,
          time: OpenCode.Generated.SessionInfoTime.t(),
          title: String.t() | nil,
          tokens: OpenCode.Generated.TokenUsageInfo.t()
        }

  defstruct [
    :agent,
    :cost,
    :fork,
    :id,
    :location,
    :metadata,
    :model,
    :outcome,
    :parent_id,
    :permissions,
    :project_id,
    :revert,
    :subpath,
    :time,
    :title,
    :tokens
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      agent: :string,
      cost: :number,
      fork: {OpenCode.Generated.SessionInfoFork, :t},
      id: :string,
      location: {OpenCode.Generated.LocationPublicRef, :t},
      metadata: :map,
      model: {OpenCode.Generated.ModelRef, :t},
      outcome: {:enum, ["succeeded", "failed", "interrupted"]},
      parent_id: :string,
      permissions: [{OpenCode.Generated.PermissionRule, :t}],
      project_id: :string,
      revert: {OpenCode.Generated.SessionRevert, :t},
      subpath: :string,
      time: {OpenCode.Generated.SessionInfoTime, :t},
      title: :string,
      tokens: {OpenCode.Generated.TokenUsageInfo, :t}
    ]
  end
end
