defmodule OpenCode.Generated.McpResourceTemplate do
  @moduledoc """
  Provides struct and type for a McpResourceTemplate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          mime_type: String.t() | nil,
          name: String.t(),
          server: String.t(),
          uri_template: String.t()
        }

  defstruct [:description, :mime_type, :name, :server, :uri_template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      mime_type: :string,
      name: :string,
      server: :string,
      uri_template: :string
    ]
  end
end
