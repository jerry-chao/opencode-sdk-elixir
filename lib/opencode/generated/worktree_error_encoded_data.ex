defmodule OpenCode.Generated.WorktreeErrorEncodedData do
  @moduledoc """
  Provides struct and type for a WorktreeErrorEncodedData
  """

  @type t :: %__MODULE__{force_required: boolean | nil, message: String.t()}

  defstruct [:force_required, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [force_required: {:union, [:boolean, :null]}, message: :string]
  end
end
