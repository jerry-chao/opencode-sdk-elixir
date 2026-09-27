defmodule OpenCode.Generated.PermissionSavedInfo do
  @moduledoc """
  Provides struct and type for a PermissionSavedInfo
  """

  @type t :: %__MODULE__{
          action: String.t(),
          id: String.t(),
          project_id: String.t(),
          resource: String.t(),
          time: OpenCode.Generated.PermissionSavedInfoTime.t()
        }

  defstruct [:action, :id, :project_id, :resource, :time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: :string,
      id: :string,
      project_id: :string,
      resource: :string,
      time: {OpenCode.Generated.PermissionSavedInfoTime, :t}
    ]
  end
end
