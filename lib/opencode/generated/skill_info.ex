defmodule OpenCode.Generated.SkillInfo do
  @moduledoc """
  Provides struct and type for a SkillInfo
  """

  @type t :: %__MODULE__{
          autoinvoke: boolean | nil,
          content: String.t(),
          description: String.t() | nil,
          id: String.t(),
          name: String.t(),
          path: String.t()
        }

  defstruct [:autoinvoke, :content, :description, :id, :name, :path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      autoinvoke: :boolean,
      content: :string,
      description: :string,
      id: :string,
      name: :string,
      path: :string
    ]
  end
end
