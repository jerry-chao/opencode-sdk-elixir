defmodule OpenCode.Generated.SessionMessageLocationSwitched do
  @moduledoc """
  Provides struct and type for a SessionMessageLocationSwitched
  """

  @type t :: %__MODULE__{
          id: String.t(),
          location: OpenCode.Generated.LocationPublicRef.t(),
          metadata: map | nil,
          previous: OpenCode.Generated.SessionMessageLocationSwitchedPrevious.t() | nil,
          project_id: String.t() | nil,
          subpath: String.t() | nil,
          time: OpenCode.Generated.SessionMessageLocationSwitchedTime.t(),
          type: String.t()
        }

  defstruct [:id, :location, :metadata, :previous, :project_id, :subpath, :time, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      location: {OpenCode.Generated.LocationPublicRef, :t},
      metadata: :map,
      previous:
        {:union, [{OpenCode.Generated.SessionMessageLocationSwitchedPrevious, :t}, :null]},
      project_id: :string,
      subpath: :string,
      time: {OpenCode.Generated.SessionMessageLocationSwitchedTime, :t},
      type: {:const, "location-switched"}
    ]
  end
end
