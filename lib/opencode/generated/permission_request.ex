defmodule OpenCode.Generated.PermissionRequest do
  @moduledoc """
  Provides struct and type for a PermissionRequest
  """

  @type t :: %__MODULE__{
          action: String.t(),
          id: String.t(),
          message: String.t() | nil,
          metadata: map | nil,
          resources: [String.t()],
          save: [String.t()] | nil,
          session_id: String.t(),
          source: map | nil
        }

  defstruct [:action, :id, :message, :metadata, :resources, :save, :session_id, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: :string,
      id: :string,
      message: :string,
      metadata: :map,
      resources: [:string],
      save: [:string],
      session_id: :string,
      source: :map
    ]
  end
end
