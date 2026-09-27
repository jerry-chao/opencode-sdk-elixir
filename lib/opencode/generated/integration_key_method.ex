defmodule OpenCode.Generated.IntegrationKeyMethod do
  @moduledoc """
  Provides struct and type for a IntegrationKeyMethod
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
          label: String.t() | nil,
          type: String.t()
        }

  defstruct [:form, :label, :type]

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
      label: :string,
      type: {:const, "key"}
    ]
  end
end
