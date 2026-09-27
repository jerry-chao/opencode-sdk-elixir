defmodule OpenCode.Generated.ShellInfo do
  @moduledoc """
  Provides struct and type for a ShellInfo
  """

  @type t :: %__MODULE__{
          command: String.t(),
          cwd: String.t(),
          exit: number | nil,
          file: String.t(),
          id: String.t(),
          metadata: map,
          pid: integer | nil,
          shell: String.t(),
          status: String.t(),
          time: OpenCode.Generated.ShellInfoTime.t()
        }

  defstruct [:command, :cwd, :exit, :file, :id, :metadata, :pid, :shell, :status, :time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      command: :string,
      cwd: :string,
      exit: :number,
      file: :string,
      id: :string,
      metadata: :map,
      pid: :integer,
      shell: :string,
      status: {:enum, ["running", "exited", "timeout", "killed"]},
      time: {OpenCode.Generated.ShellInfoTime, :t}
    ]
  end
end
