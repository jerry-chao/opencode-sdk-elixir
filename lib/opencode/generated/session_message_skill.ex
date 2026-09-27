defmodule OpenCode.Generated.SessionMessageSkill do
  @moduledoc """
  Provides struct and type for a SessionMessageSkill
  """

  @type t :: %__MODULE__{
          id: String.t(),
          metadata: map | nil,
          name: String.t(),
          skill: String.t(),
          text: String.t(),
          time: OpenCode.Generated.SessionMessageSkillTime.t(),
          type: String.t()
        }

  defstruct [:id, :metadata, :name, :skill, :text, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      metadata: :map,
      name: :string,
      skill: :string,
      text: :string,
      time: {OpenCode.Generated.SessionMessageSkillTime, :t},
      type: {:const, "skill"}
    ]
  end
end
