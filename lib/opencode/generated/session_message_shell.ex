defmodule OpenCode.Generated.SessionMessageShell do
  @moduledoc """
  Provides struct and type for a SessionMessageShell
  """

  @type t :: %__MODULE__{
          command: String.t(),
          exit: number | String.t() | nil,
          id: String.t(),
          metadata: map | nil,
          output: OpenCode.Generated.SessionMessageShellOutput.t() | nil,
          shell_id: String.t(),
          status: String.t(),
          time: OpenCode.Generated.SessionMessageShellTime.t(),
          type: String.t()
        }

  defstruct [:command, :exit, :id, :metadata, :output, :shell_id, :status, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      command: :string,
      exit: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      id: :string,
      metadata: :map,
      output: {OpenCode.Generated.SessionMessageShellOutput, :t},
      shell_id: :string,
      status: {:enum, ["running", "exited", "timeout", "killed"]},
      time: {OpenCode.Generated.SessionMessageShellTime, :t},
      type: {:const, "shell"}
    ]
  end
end
