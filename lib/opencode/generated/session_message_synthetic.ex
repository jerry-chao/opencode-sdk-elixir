defmodule OpenCode.Generated.SessionMessageSynthetic do
  @moduledoc """
  Provides struct and type for a SessionMessageSynthetic
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: String.t(),
          metadata: map | nil,
          text: String.t(),
          time: OpenCode.Generated.SessionMessageSyntheticTime.t(),
          type: String.t()
        }

  defstruct [:description, :id, :metadata, :text, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      id: :string,
      metadata: :map,
      text: :string,
      time: {OpenCode.Generated.SessionMessageSyntheticTime, :t},
      type: {:const, "synthetic"}
    ]
  end
end
