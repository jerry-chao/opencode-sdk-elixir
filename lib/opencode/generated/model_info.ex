defmodule OpenCode.Generated.ModelInfo do
  @moduledoc """
  Provides struct and type for a ModelInfo
  """

  @type t :: %__MODULE__{
          body: map | nil,
          canonical: String.t() | nil,
          capabilities: OpenCode.Generated.ModelCapabilities.t(),
          compatibility: OpenCode.Generated.ModelCompatibility.t() | nil,
          cost: [OpenCode.Generated.ModelCost.t()],
          enabled: boolean,
          family: String.t() | nil,
          headers: map | nil,
          id: String.t(),
          limit: OpenCode.Generated.ModelInfoLimit.t(),
          model_id: String.t(),
          name: String.t(),
          package: String.t() | nil,
          provider_id: String.t(),
          settings: OpenCode.Generated.ModelSettings.t() | nil,
          status: String.t(),
          time: OpenCode.Generated.ModelInfoTime.t(),
          variants: [OpenCode.Generated.ModelVariant.t()]
        }

  defstruct [
    :body,
    :canonical,
    :capabilities,
    :compatibility,
    :cost,
    :enabled,
    :family,
    :headers,
    :id,
    :limit,
    :model_id,
    :name,
    :package,
    :provider_id,
    :settings,
    :status,
    :time,
    :variants
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: :map,
      canonical: :string,
      capabilities: {OpenCode.Generated.ModelCapabilities, :t},
      compatibility: {OpenCode.Generated.ModelCompatibility, :t},
      cost: [{OpenCode.Generated.ModelCost, :t}],
      enabled: :boolean,
      family: :string,
      headers: :map,
      id: :string,
      limit: {OpenCode.Generated.ModelInfoLimit, :t},
      model_id: :string,
      name: :string,
      package: :string,
      provider_id: :string,
      settings: {OpenCode.Generated.ModelSettings, :t},
      status: {:enum, ["alpha", "beta", "deprecated", "active"]},
      time: {OpenCode.Generated.ModelInfoTime, :t},
      variants: [{OpenCode.Generated.ModelVariant, :t}]
    ]
  end
end
