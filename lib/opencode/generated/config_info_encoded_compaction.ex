defmodule OpenCode.Generated.ConfigInfoEncodedCompaction do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedCompaction
  """

  @type t :: %__MODULE__{
          auto: boolean | nil,
          buffer: integer | nil,
          keep: OpenCode.Generated.ConfigInfoEncodedCompactionKeep.t() | nil
        }

  defstruct [:auto, :buffer, :keep]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auto: :boolean,
      buffer: :integer,
      keep: {OpenCode.Generated.ConfigInfoEncodedCompactionKeep, :t}
    ]
  end
end
