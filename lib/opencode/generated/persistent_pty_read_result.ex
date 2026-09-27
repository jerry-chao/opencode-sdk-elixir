defmodule OpenCode.Generated.PersistentPtyReadResult do
  @moduledoc """
  Provides struct and type for a PersistentPtyReadResult
  """

  @type t :: %__MODULE__{
          cwd: String.t(),
          foreground_process: String.t() | nil,
          pty_id: String.t(),
          screen: OpenCode.Generated.PersistentPtyReadResultScreen.t(),
          title: String.t()
        }

  defstruct [:cwd, :foreground_process, :pty_id, :screen, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cwd: :string,
      foreground_process: {:union, [:string, :null]},
      pty_id: :string,
      screen: {OpenCode.Generated.PersistentPtyReadResultScreen, :t},
      title: :string
    ]
  end
end
