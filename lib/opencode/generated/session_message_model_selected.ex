defmodule OpenCode.Generated.SessionMessageModelSelected do
  @moduledoc """
  Provides struct and type for a SessionMessageModelSelected
  """

  @type t :: %__MODULE__{
          id: String.t(),
          metadata: map | nil,
          model: OpenCode.Generated.ModelRef.t(),
          previous: OpenCode.Generated.ModelRef.t() | nil,
          time: OpenCode.Generated.SessionMessageModelSelectedTime.t(),
          type: String.t()
        }

  defstruct [:id, :metadata, :model, :previous, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      metadata: :map,
      model: {OpenCode.Generated.ModelRef, :t},
      previous: {OpenCode.Generated.ModelRef, :t},
      time: {OpenCode.Generated.SessionMessageModelSelectedTime, :t},
      type: {:const, "model-switched"}
    ]
  end
end
