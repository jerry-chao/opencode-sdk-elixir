defmodule OpenCode.Generated.FormDetail do
  @moduledoc """
  Provides struct and type for a FormDetail
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
          id: String.t(),
          metadata: map | nil,
          session_id: String.t(),
          state: OpenCode.Generated.FormDetailState.t(),
          title: String.t()
        }

  defstruct [:fields, :id, :metadata, :session_id, :state, :title]

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
      id: :string,
      metadata: :map,
      session_id: :string,
      state: {OpenCode.Generated.FormDetailState, :t},
      title: :string
    ]
  end
end
