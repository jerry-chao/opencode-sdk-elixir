defmodule OpenCode.Generated.McpOAuthConfigEncoded do
  @moduledoc """
  Provides struct and type for a McpOAuthConfigEncoded
  """

  @type t :: %__MODULE__{
          auth_server_metadata_url: String.t() | nil,
          callback_port: integer | nil,
          client_id: String.t() | nil,
          client_secret: String.t() | nil,
          redirect_uri: String.t() | nil,
          scope: String.t() | nil
        }

  defstruct [
    :auth_server_metadata_url,
    :callback_port,
    :client_id,
    :client_secret,
    :redirect_uri,
    :scope
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auth_server_metadata_url: :string,
      callback_port: :integer,
      client_id: :string,
      client_secret: :string,
      redirect_uri: :string,
      scope: :string
    ]
  end
end
