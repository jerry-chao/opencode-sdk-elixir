defmodule OpenCode.Generated.PersistentPtyInfo do
  @moduledoc """
  Provides struct and type for a PersistentPtyInfo
  """

  @type t :: %__MODULE__{
          args: [String.t()],
          command: String.t(),
          cwd: String.t(),
          exit_code: integer | nil,
          foreground_process: String.t() | nil,
          id: String.t(),
          output: OpenCode.Generated.PersistentPtyInfoOutput.t(),
          pid: integer,
          session_id: String.t(),
          size: OpenCode.Generated.PersistentPtyInfoSize.t(),
          status: String.t(),
          title: String.t()
        }

  defstruct [
    :args,
    :command,
    :cwd,
    :exit_code,
    :foreground_process,
    :id,
    :output,
    :pid,
    :session_id,
    :size,
    :status,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      args: [:string],
      command: :string,
      cwd: :string,
      exit_code: :integer,
      foreground_process: {:union, [:string, :null]},
      id: :string,
      output: {OpenCode.Generated.PersistentPtyInfoOutput, :t},
      pid: :integer,
      session_id: :string,
      size: {OpenCode.Generated.PersistentPtyInfoSize, :t},
      status: {:enum, ["running", "exited"]},
      title: :string
    ]
  end
end
