defmodule OpenCode.Generated.Permission do
  @moduledoc """
  Provides API endpoints related to permission
  """

  @default_client OpenCode.Client

  @type permission_request_list_200_json_resp :: %{
          data: [OpenCode.Generated.PermissionRequest.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List pending permission requests

  Retrieve pending permission requests for a location.

  ## Options

    * `location`

  """
  @spec permission_request_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Permission.permission_request_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def permission_request_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Permission, :permission_request_list},
      url: "/api/permission/request",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Permission, :permission_request_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type permission_saved_list_200_json_resp :: %{
          data: [OpenCode.Generated.PermissionSavedInfo.t()]
        }

  @doc """
  List saved permissions

  Retrieve saved permissions, optionally filtered by project.

  ## Options

    * `projectID`

  """
  @spec permission_saved_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Permission.permission_saved_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def permission_saved_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:projectID])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Permission, :permission_saved_list},
      url: "/api/permission/saved",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Permission, :permission_saved_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove saved permission

  Remove a saved permission by ID.
  """
  @spec permission_saved_remove(id :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def permission_saved_remove(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {OpenCode.Generated.Permission, :permission_saved_remove},
      url: "/api/permission/saved/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_permission_create_200_json_resp :: %{
          data: OpenCode.Generated.Permission.session_permission_create_200_json_resp_data()
        }

  @type session_permission_create_200_json_resp_data :: %{effect: String.t(), id: String.t()}

  @doc """
  Create permission request

  Evaluate and, when approval is required, create a permission request for a session.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_permission_create(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Permission.session_permission_create_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_permission_create(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Permission, :session_permission_create},
      url: "/api/session/#{sessionID}/permission",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Permission, :session_permission_create_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_permission_get_200_json_resp :: %{data: OpenCode.Generated.PermissionRequest.t()}

  @doc """
  Get permission request

  Retrieve a pending permission request owned by a session.
  """
  @spec session_permission_get(sessionID :: String.t(), requestID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Permission.session_permission_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PermissionNotFoundErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_permission_get(sessionID, requestID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, requestID: requestID],
      call: {OpenCode.Generated.Permission, :session_permission_get},
      url: "/api/session/#{sessionID}/permission/#{requestID}",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Permission, :session_permission_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.PermissionNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @type session_permission_list_200_json_resp :: %{
          data: [OpenCode.Generated.PermissionRequest.t()]
        }

  @doc """
  List session permission requests

  Retrieve pending permission requests owned by a session.
  """
  @spec session_permission_list(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Permission.session_permission_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_permission_list(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Permission, :session_permission_list},
      url: "/api/session/#{sessionID}/permission",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Permission, :session_permission_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reply to pending permission request

  Respond to a pending permission request owned by a session.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_permission_reply(
          sessionID :: String.t(),
          requestID :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.PermissionNotFoundErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_permission_reply(sessionID, requestID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, requestID: requestID, body: body],
      call: {OpenCode.Generated.Permission, :session_permission_reply},
      url: "/api/session/#{sessionID}/permission/#{requestID}/reply",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.PermissionNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:permission_request_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.PermissionRequest, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:permission_saved_list_200_json_resp) do
    [data: [{OpenCode.Generated.PermissionSavedInfo, :t}]]
  end

  def __fields__(:session_permission_create_200_json_resp) do
    [data: {OpenCode.Generated.Permission, :session_permission_create_200_json_resp_data}]
  end

  def __fields__(:session_permission_create_200_json_resp_data) do
    [effect: {:enum, ["allow", "deny", "ask"]}, id: :string]
  end

  def __fields__(:session_permission_get_200_json_resp) do
    [data: {OpenCode.Generated.PermissionRequest, :t}]
  end

  def __fields__(:session_permission_list_200_json_resp) do
    [data: [{OpenCode.Generated.PermissionRequest, :t}]]
  end
end
