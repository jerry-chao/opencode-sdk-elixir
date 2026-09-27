defmodule OpenCode.Generated.SessionRevert do
  @moduledoc """
  Provides struct and type for a SessionRevert
  """

  @type t :: %__MODULE__{
          files: [OpenCode.Generated.FileDiffInfo.t()] | nil,
          message_id: String.t(),
          part_id: String.t() | nil,
          snapshot: String.t() | nil
        }

  defstruct [:files, :message_id, :part_id, :snapshot]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      files: [{OpenCode.Generated.FileDiffInfo, :t}],
      message_id: :string,
      part_id: :string,
      snapshot: :string
    ]
  end
end
