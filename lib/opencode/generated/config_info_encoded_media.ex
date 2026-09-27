defmodule OpenCode.Generated.ConfigInfoEncodedMedia do
  @moduledoc """
  Provides struct and type for a ConfigInfoEncodedMedia
  """

  @type t :: %__MODULE__{image: OpenCode.Generated.ConfigInfoEncodedMediaImage.t() | nil}

  defstruct [:image]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image: {OpenCode.Generated.ConfigInfoEncodedMediaImage, :t}]
  end
end
