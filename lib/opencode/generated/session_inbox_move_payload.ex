defmodule OpenCode.Generated.SessionInboxMovePayload do
  @moduledoc """
  Provides struct and type for a SessionInboxMovePayload
  """

  @type t :: %__MODULE__{
          location: OpenCode.Generated.LocationPublicRef.t(),
          project_id: String.t(),
          subpath: String.t() | nil
        }

  defstruct [:location, :project_id, :subpath]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [location: {OpenCode.Generated.LocationPublicRef, :t}, project_id: :string, subpath: :string]
  end
end
