defmodule OpenCode.Generated.Credential do
  @moduledoc """
  Provides API endpoints related to credential
  """

  @default_client OpenCode.Client

  @doc """
  Activate credential

  Activate a stored integration credential.
  """
  @spec credential_activate(credentialID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def credential_activate(credentialID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [credentialID: credentialID],
      call: {OpenCode.Generated.Credential, :credential_activate},
      url: "/api/credential/#{credentialID}/activate",
      method: :post,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove credential

  Remove a stored integration credential.
  """
  @spec credential_remove(credentialID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def credential_remove(credentialID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [credentialID: credentialID],
      call: {OpenCode.Generated.Credential, :credential_remove},
      url: "/api/credential/#{credentialID}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update credential

  Update a stored credential label.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec credential_update(credentialID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def credential_update(credentialID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [credentialID: credentialID, body: body],
      call: {OpenCode.Generated.Credential, :credential_update},
      url: "/api/credential/#{credentialID}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
