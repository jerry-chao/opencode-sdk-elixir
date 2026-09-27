defmodule OpenCode.Generated.ProviderInfo do
  @moduledoc """
  Provides struct and type for a ProviderInfo
  """

  @type t :: %__MODULE__{
          activation: String.t(),
          body: map | nil,
          canonical: String.t() | nil,
          headers: map | nil,
          id: String.t(),
          integration_id: String.t() | nil,
          name: String.t(),
          package: String.t(),
          settings: OpenCode.Generated.ProviderSettings.t() | nil
        }

  defstruct [
    :activation,
    :body,
    :canonical,
    :headers,
    :id,
    :integration_id,
    :name,
    :package,
    :settings
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activation: {:enum, ["auto", "enabled", "disabled"]},
      body: :map,
      canonical: :string,
      headers: :map,
      id: :string,
      integration_id: :string,
      name: :string,
      package: :string,
      settings: {OpenCode.Generated.ProviderSettings, :t}
    ]
  end
end
