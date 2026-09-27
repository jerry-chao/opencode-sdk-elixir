defmodule OpenCode.Generated.Integration do
  @moduledoc """
  Provides API endpoints related to integration
  """

  @default_client OpenCode.Client

  @doc """
  Add wellknown integration

  Discover and persist an experimental wellknown integration source.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_integration_wellknown_add(body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_integration_wellknown_add(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Integration, :experimental_integration_wellknown_add},
      url: "/api/experimental/integration/wellknown",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Cancel command connection

  Cancel a command authentication attempt and terminate its process.

  ## Options

    * `location`

  """
  @spec integration_command_cancel(
          integrationID :: String.t(),
          attemptID :: String.t(),
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_command_cancel(integrationID, attemptID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, attemptID: attemptID],
      call: {OpenCode.Generated.Integration, :integration_command_cancel},
      url: "/api/integration/#{integrationID}/connect/command/#{attemptID}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type integration_command_connect_200_json_resp :: %{
          data: OpenCode.Generated.IntegrationCommandAttempt.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Begin command connection

  Start a command authentication attempt.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec integration_command_connect(integrationID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Integration.integration_command_connect_200_json_resp()}
          | {:error,
             OpenCode.Generated.IntegrationMethodNotFoundErrorEncoded.t()
             | OpenCode.Generated.IntegrationNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_command_connect(integrationID, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, body: body],
      call: {OpenCode.Generated.Integration, :integration_command_connect},
      url: "/api/integration/#{integrationID}/connect/command",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Integration, :integration_command_connect_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.IntegrationMethodNotFoundErrorEncoded, :t},
            {OpenCode.Generated.IntegrationNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @type integration_command_status_200_json_resp :: %{
          data: OpenCode.Generated.Integration.integration_command_status_200_json_resp_data(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @type integration_command_status_200_json_resp_data :: %{
          message: String.t() | nil,
          status: String.t(),
          time:
            OpenCode.Generated.Integration.integration_command_status_200_json_resp_data_time()
        }

  @doc """
  Get command attempt status

  Poll the current status and output of a command authentication attempt.

  ## Options

    * `location`

  """
  @spec integration_command_status(
          integrationID :: String.t(),
          attemptID :: String.t(),
          opts :: keyword
        ) ::
          {:ok, OpenCode.Generated.Integration.integration_command_status_200_json_resp()}
          | {:error,
             OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded.t()
             | OpenCode.Generated.IntegrationNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_command_status(integrationID, attemptID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, attemptID: attemptID],
      call: {OpenCode.Generated.Integration, :integration_command_status},
      url: "/api/integration/#{integrationID}/connect/command/#{attemptID}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Integration, :integration_command_status_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded, :t},
            {OpenCode.Generated.IntegrationNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Connect with key

  Run a key authentication method and store the resulting credential.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec integration_connect_key(integrationID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.IntegrationNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_connect_key(integrationID, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, body: body],
      call: {OpenCode.Generated.Integration, :integration_connect_key},
      url: "/api/integration/#{integrationID}/connect/key",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.IntegrationNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type integration_get_200_json_resp :: %{
          data: OpenCode.Generated.IntegrationInfo.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Get integration

  Retrieve one integration and its authentication methods.

  ## Options

    * `location`

  """
  @spec integration_get(integrationID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Integration.integration_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.IntegrationNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_get(integrationID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID],
      call: {OpenCode.Generated.Integration, :integration_get},
      url: "/api/integration/#{integrationID}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Integration, :integration_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.IntegrationNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type integration_list_200_json_resp :: %{
          data: [OpenCode.Generated.IntegrationInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List integrations

  Retrieve available integrations and their authentication methods.

  ## Options

    * `location`

  """
  @spec integration_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Integration.integration_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Integration, :integration_list},
      url: "/api/integration",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Integration, :integration_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Cancel OAuth connection

  Cancel an OAuth attempt and release its resources.

  ## Options

    * `location`

  """
  @spec integration_oauth_cancel(
          integrationID :: String.t(),
          attemptID :: String.t(),
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_oauth_cancel(integrationID, attemptID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, attemptID: attemptID],
      call: {OpenCode.Generated.Integration, :integration_oauth_cancel},
      url: "/api/integration/#{integrationID}/connect/oauth/#{attemptID}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Complete OAuth connection

  Complete a code-based OAuth attempt and store the resulting credential.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec integration_oauth_complete(
          integrationID :: String.t(),
          attemptID :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded.t()
             | OpenCode.Generated.IntegrationNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_oauth_complete(integrationID, attemptID, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, attemptID: attemptID, body: body],
      call: {OpenCode.Generated.Integration, :integration_oauth_complete},
      url: "/api/integration/#{integrationID}/connect/oauth/#{attemptID}/complete",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded, :t},
            {OpenCode.Generated.IntegrationNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @type integration_oauth_connect_200_json_resp :: %{
          data: OpenCode.Generated.IntegrationAttemptEncoded.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Begin OAuth connection

  Start an OAuth attempt and return the authorization details.

  ## Options

    * `location`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec integration_oauth_connect(integrationID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Integration.integration_oauth_connect_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_oauth_connect(integrationID, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, body: body],
      call: {OpenCode.Generated.Integration, :integration_oauth_connect},
      url: "/api/integration/#{integrationID}/connect/oauth",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Integration, :integration_oauth_connect_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type integration_oauth_status_200_json_resp :: %{
          data: OpenCode.Generated.Integration.integration_oauth_status_200_json_resp_data(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @type integration_oauth_status_200_json_resp_data :: %{
          message: String.t(),
          status: String.t(),
          time: OpenCode.Generated.Integration.integration_oauth_status_200_json_resp_data_time()
        }

  @doc """
  Get OAuth attempt status

  Poll the current status of an OAuth attempt.

  ## Options

    * `location`

  """
  @spec integration_oauth_status(
          integrationID :: String.t(),
          attemptID :: String.t(),
          opts :: keyword
        ) ::
          {:ok, OpenCode.Generated.Integration.integration_oauth_status_200_json_resp()}
          | {:error,
             OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded.t()
             | OpenCode.Generated.IntegrationNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def integration_oauth_status(integrationID, attemptID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [integrationID: integrationID, attemptID: attemptID],
      call: {OpenCode.Generated.Integration, :integration_oauth_status},
      url: "/api/integration/#{integrationID}/connect/oauth/#{attemptID}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Integration, :integration_oauth_status_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.IntegrationAttemptNotFoundErrorEncoded, :t},
            {OpenCode.Generated.IntegrationNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:integration_command_connect_200_json_resp) do
    [
      data: {OpenCode.Generated.IntegrationCommandAttempt, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:integration_command_status_200_json_resp) do
    [
      data: {OpenCode.Generated.Integration, :integration_command_status_200_json_resp_data},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:integration_command_status_200_json_resp_data) do
    [
      message: :string,
      status: {:enum, ["complete", "expired", "failed", "pending"]},
      time: {OpenCode.Generated.Integration, :integration_command_status_200_json_resp_data_time}
    ]
  end

  @type integration_command_status_200_json_resp_data_time :: %{
          created: number | String.t(),
          expires: number | String.t()
        }

  def __fields__(:integration_command_status_200_json_resp_data_time) do
    [
      created: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      expires: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]}
    ]
  end

  def __fields__(:integration_get_200_json_resp) do
    [
      data: {OpenCode.Generated.IntegrationInfo, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:integration_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.IntegrationInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:integration_oauth_connect_200_json_resp) do
    [
      data: {OpenCode.Generated.IntegrationAttemptEncoded, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:integration_oauth_status_200_json_resp) do
    [
      data: {OpenCode.Generated.Integration, :integration_oauth_status_200_json_resp_data},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:integration_oauth_status_200_json_resp_data) do
    [
      message: :string,
      status: {:enum, ["complete", "expired", "failed", "pending"]},
      time: {OpenCode.Generated.Integration, :integration_oauth_status_200_json_resp_data_time}
    ]
  end

  @type integration_oauth_status_200_json_resp_data_time :: %{
          created: number | String.t(),
          expires: number | String.t()
        }

  def __fields__(:integration_oauth_status_200_json_resp_data_time) do
    [
      created: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]},
      expires: {:union, [:number, enum: ["Infinity", "-Infinity", "NaN"]]}
    ]
  end
end
