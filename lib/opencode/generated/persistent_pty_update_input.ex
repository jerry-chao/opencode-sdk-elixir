defmodule OpenCode.Generated.PersistentPtyUpdateInput do
  @moduledoc """
  Provides struct and type for a PersistentPtyUpdateInput
  """

  @type t :: %__MODULE__{
          attachment_id: String.t() | nil,
          size: OpenCode.Generated.PersistentPtyUpdateInputSize.t()
        }

  defstruct [:attachment_id, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attachment_id: :string, size: {OpenCode.Generated.PersistentPtyUpdateInputSize, :t}]
  end
end
