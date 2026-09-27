defmodule OpenCode.Generated.FormNumberField do
  @moduledoc """
  Provides struct and type for a FormNumberField
  """

  @type t :: %__MODULE__{
          default: number | String.t() | nil,
          description: String.t() | nil,
          hidden: boolean | nil,
          key: String.t(),
          maximum: number | String.t() | nil,
          minimum: number | String.t() | nil,
          required: boolean | nil,
          title: String.t() | nil,
          type: String.t(),
          when: [OpenCode.Generated.FormWhen.t()] | nil
        }

  defstruct [
    :default,
    :description,
    :hidden,
    :key,
    :maximum,
    :minimum,
    :required,
    :title,
    :type,
    :when
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      description: :string,
      hidden: :boolean,
      key: :string,
      maximum: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      minimum: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      required: :boolean,
      title: :string,
      type: {:const, "number"},
      when: [{OpenCode.Generated.FormWhen, :t}]
    ]
  end
end
