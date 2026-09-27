defmodule OpenCode.Generated.FormStringField do
  @moduledoc """
  Provides struct and type for a FormStringField
  """

  @type t :: %__MODULE__{
          custom: boolean | nil,
          default: String.t() | nil,
          description: String.t() | nil,
          format: String.t() | nil,
          hidden: boolean | nil,
          key: String.t(),
          max_length: integer | nil,
          min_length: integer | nil,
          options: [OpenCode.Generated.FormOption.t()] | nil,
          pattern: String.t() | nil,
          placeholder: String.t() | nil,
          required: boolean | nil,
          title: String.t() | nil,
          type: String.t(),
          when: [OpenCode.Generated.FormWhen.t()] | nil
        }

  defstruct [
    :custom,
    :default,
    :description,
    :format,
    :hidden,
    :key,
    :max_length,
    :min_length,
    :options,
    :pattern,
    :placeholder,
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
      custom: :boolean,
      default: :string,
      description: :string,
      format: {:enum, ["email", "uri", "date", "date-time"]},
      hidden: :boolean,
      key: :string,
      max_length: :integer,
      min_length: :integer,
      options: [{OpenCode.Generated.FormOption, :t}],
      pattern: :string,
      placeholder: :string,
      required: :boolean,
      title: :string,
      type: {:const, "string"},
      when: [{OpenCode.Generated.FormWhen, :t}]
    ]
  end
end
