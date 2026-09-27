defmodule OpenCode.Generated.FormMultiselectField do
  @moduledoc """
  Provides struct and type for a FormMultiselectField
  """

  @type t :: %__MODULE__{
          custom: boolean | nil,
          default: [String.t()] | nil,
          description: String.t() | nil,
          hidden: boolean | nil,
          key: String.t(),
          max_items: integer | nil,
          min_items: integer | nil,
          options: [OpenCode.Generated.FormOption.t()],
          required: boolean | nil,
          title: String.t() | nil,
          type: String.t(),
          when: [OpenCode.Generated.FormWhen.t()] | nil
        }

  defstruct [
    :custom,
    :default,
    :description,
    :hidden,
    :key,
    :max_items,
    :min_items,
    :options,
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
      default: [:string],
      description: :string,
      hidden: :boolean,
      key: :string,
      max_items: :integer,
      min_items: :integer,
      options: [{OpenCode.Generated.FormOption, :t}],
      required: :boolean,
      title: :string,
      type: {:const, "multiselect"},
      when: [{OpenCode.Generated.FormWhen, :t}]
    ]
  end
end
