defmodule OpenCode.Generated.PersistentPtyReadResultScreen do
  @moduledoc """
  Provides struct and type for a PersistentPtyReadResultScreen
  """

  @type t :: %__MODULE__{
          cols: integer,
          cursor: OpenCode.Generated.PersistentPtyReadResultScreenCursor.t(),
          rows: integer,
          text: String.t()
        }

  defstruct [:cols, :cursor, :rows, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cols: :integer,
      cursor: {OpenCode.Generated.PersistentPtyReadResultScreenCursor, :t},
      rows: :integer,
      text: :string
    ]
  end
end
