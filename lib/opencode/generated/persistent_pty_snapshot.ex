defmodule OpenCode.Generated.PersistentPtySnapshot do
  @moduledoc """
  Provides struct and type for a PersistentPtySnapshot
  """

  @type t :: %__MODULE__{
          checkpoint: String.t(),
          cursor: OpenCode.Generated.PersistentPtySnapshotCursor.t(),
          info: OpenCode.Generated.PersistentPtyInfo.t(),
          text: String.t()
        }

  defstruct [:checkpoint, :cursor, :info, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkpoint: {:string, "byte"},
      cursor: {OpenCode.Generated.PersistentPtySnapshotCursor, :t},
      info: {OpenCode.Generated.PersistentPtyInfo, :t},
      text: :string
    ]
  end
end
