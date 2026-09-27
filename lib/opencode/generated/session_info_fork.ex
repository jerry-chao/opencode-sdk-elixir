defmodule OpenCode.Generated.SessionInfoFork do
  @moduledoc """
  Provides struct and type for a SessionInfoFork
  """

  @type t :: %__MODULE__{
          boundary: OpenCode.Generated.SessionInfoForkBoundary.t(),
          session_id: String.t()
        }

  defstruct [:boundary, :session_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [boundary: {OpenCode.Generated.SessionInfoForkBoundary, :t}, session_id: :string]
  end
end
