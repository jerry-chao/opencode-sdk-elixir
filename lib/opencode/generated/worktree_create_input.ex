defmodule OpenCode.Generated.WorktreeCreateInput do
  @moduledoc """
  Provides struct and type for a WorktreeCreateInput
  """

  @type t :: %__MODULE__{
          branch: String.t() | nil,
          directory: String.t() | nil,
          from: String.t() | nil,
          name: String.t() | nil,
          project_id: String.t()
        }

  defstruct [:branch, :directory, :from, :name, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [branch: :string, directory: :string, from: :string, name: :string, project_id: :string]
  end
end
