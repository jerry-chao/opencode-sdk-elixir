defmodule OpenCode.Generated.WorktreeRemoveInput do
  @moduledoc """
  Provides struct and type for a WorktreeRemoveInput
  """

  @type t :: %__MODULE__{directory: String.t(), force: boolean, project_id: String.t()}

  defstruct [:directory, :force, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [directory: :string, force: :boolean, project_id: :string]
  end
end
