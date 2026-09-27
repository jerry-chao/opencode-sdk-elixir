defmodule OpenCode.Generated.PersistentPtyHandoff do
  @moduledoc """
  Provides struct and type for a PersistentPtyHandoff
  """

  @type t :: %__MODULE__{
          directory: String.t(),
          expires_at: number | String.t(),
          instance_id: String.t(),
          ticket: String.t()
        }

  defstruct [:directory, :expires_at, :instance_id, :ticket]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      directory: :string,
      expires_at: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      instance_id: :string,
      ticket: :string
    ]
  end
end
