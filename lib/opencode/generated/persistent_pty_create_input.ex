defmodule OpenCode.Generated.PersistentPtyCreateInput do
  @moduledoc """
  Provides struct and type for a PersistentPtyCreateInput
  """

  @type t :: %__MODULE__{
          args: [String.t()],
          command: String.t() | nil,
          cwd: String.t() | nil,
          env: map,
          size: OpenCode.Generated.PersistentPtyCreateInputSize.t() | nil,
          title: String.t()
        }

  defstruct [:args, :command, :cwd, :env, :size, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      args: [:string],
      command: :string,
      cwd: :string,
      env: :map,
      size: {OpenCode.Generated.PersistentPtyCreateInputSize, :t},
      title: :string
    ]
  end
end
