defmodule OpenCode.Generated.SkillNotFoundErrorEncoded do
  @moduledoc """
  Provides struct and type for a SkillNotFoundErrorEncoded
  """

  @type t :: %__MODULE__{message: String.t(), skill: String.t(), tag: String.t()}

  defstruct [:message, :skill, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, skill: :string, tag: {:const, "SkillNotFoundError"}]
  end
end
