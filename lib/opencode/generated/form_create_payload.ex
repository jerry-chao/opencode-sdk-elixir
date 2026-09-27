defmodule OpenCode.Generated.FormCreatePayload do
  @moduledoc """
  Provides struct and type for a FormCreatePayload
  """

  @type t :: %__MODULE__{
          fields: [
            OpenCode.Generated.FormBooleanField.t()
            | OpenCode.Generated.FormExternalField.t()
            | OpenCode.Generated.FormIntegerField.t()
            | OpenCode.Generated.FormMultiselectField.t()
            | OpenCode.Generated.FormNumberField.t()
            | OpenCode.Generated.FormStringField.t()
          ],
          id: String.t() | nil,
          metadata: map | nil,
          title: String.t()
        }

  defstruct [:fields, :id, :metadata, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fields: [
        union: [
          {OpenCode.Generated.FormBooleanField, :t},
          {OpenCode.Generated.FormExternalField, :t},
          {OpenCode.Generated.FormIntegerField, :t},
          {OpenCode.Generated.FormMultiselectField, :t},
          {OpenCode.Generated.FormNumberField, :t},
          {OpenCode.Generated.FormStringField, :t}
        ]
      ],
      id: {:union, [:string, :null]},
      metadata: :map,
      title: :string
    ]
  end
end
