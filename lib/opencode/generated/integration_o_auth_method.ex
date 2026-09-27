defmodule OpenCode.Generated.IntegrationOAuthMethod do
  @moduledoc """
  Provides struct and type for a IntegrationOAuthMethod
  """

  @type t :: %__MODULE__{
          form:
            [
              OpenCode.Generated.FormBooleanField.t()
              | OpenCode.Generated.FormExternalField.t()
              | OpenCode.Generated.FormIntegerField.t()
              | OpenCode.Generated.FormMultiselectField.t()
              | OpenCode.Generated.FormNumberField.t()
              | OpenCode.Generated.FormStringField.t()
            ]
            | nil,
          id: String.t(),
          label: String.t(),
          type: String.t()
        }

  defstruct [:form, :id, :label, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      form: [
        union: [
          {OpenCode.Generated.FormBooleanField, :t},
          {OpenCode.Generated.FormExternalField, :t},
          {OpenCode.Generated.FormIntegerField, :t},
          {OpenCode.Generated.FormMultiselectField, :t},
          {OpenCode.Generated.FormNumberField, :t},
          {OpenCode.Generated.FormStringField, :t}
        ]
      ],
      id: :string,
      label: :string,
      type: {:const, "oauth"}
    ]
  end
end
