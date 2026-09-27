defmodule OpenCode.Generated.SessionInboxSyntheticPayload do
  @moduledoc """
  Provides struct and type for a SessionInboxSyntheticPayload
  """

  @type t :: %__MODULE__{description: String.t() | nil, metadata: map | nil, text: String.t()}

  defstruct [:description, :metadata, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, metadata: :map, text: :string]
  end
end
