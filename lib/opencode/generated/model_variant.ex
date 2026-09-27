defmodule OpenCode.Generated.ModelVariant do
  @moduledoc """
  Provides struct and type for a ModelVariant
  """

  @type t :: %__MODULE__{
          body: map | nil,
          headers: map | nil,
          id: String.t(),
          settings: OpenCode.Generated.ModelSettings.t() | nil
        }

  defstruct [:body, :headers, :id, :settings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [body: :map, headers: :map, id: :string, settings: {OpenCode.Generated.ModelSettings, :t}]
  end
end
