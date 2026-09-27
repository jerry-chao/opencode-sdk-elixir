defmodule OpenCode.Generated.FormBooleanField do
  @moduledoc """
  Provides struct and type for a FormBooleanField
  """

  @type t :: %__MODULE__{
          default: boolean | nil,
          description: String.t() | nil,
          hidden: boolean | nil,
          key: String.t(),
          required: boolean | nil,
          title: String.t() | nil,
          type: String.t(),
          when: [OpenCode.Generated.FormWhen.t()] | nil
        }

  defstruct [:default, :description, :hidden, :key, :required, :title, :type, :when]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default: :boolean,
      description: :string,
      hidden: :boolean,
      key: :string,
      required: :boolean,
      title: :string,
      type: {:const, "boolean"},
      when: [{OpenCode.Generated.FormWhen, :t}]
    ]
  end
end
