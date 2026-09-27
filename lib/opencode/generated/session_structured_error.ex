defmodule OpenCode.Generated.SessionStructuredError do
  @moduledoc """
  Provides struct and type for a SessionStructuredError
  """

  @type t :: %__MODULE__{message: String.t(), status: integer | nil, type: String.t()}

  defstruct [:message, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, status: :integer, type: :string]
  end
end
