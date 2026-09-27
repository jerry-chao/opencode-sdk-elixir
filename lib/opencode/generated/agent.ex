defmodule OpenCode.Generated.Agent do
  @moduledoc """
  Provides API endpoints related to agent
  """

  @default_client OpenCode.Client

  @type agent_get_200_json_resp :: %{
          data: OpenCode.Generated.AgentInfo.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Get agent

  Retrieve a single currently registered agent.

  ## Options

    * `location`

  """
  @spec agent_get(agentID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Agent.agent_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.AgentNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def agent_get(agentID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [agentID: agentID],
      call: {OpenCode.Generated.Agent, :agent_get},
      url: "/api/agent/#{agentID}",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Agent, :agent_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.AgentNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type agent_list_200_json_resp :: %{
          data: [OpenCode.Generated.AgentInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List agents

  Retrieve currently registered agents.

  ## Options

    * `location`

  """
  @spec agent_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Agent.agent_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def agent_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Agent, :agent_list},
      url: "/api/agent",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Agent, :agent_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:agent_get_200_json_resp) do
    [
      data: {OpenCode.Generated.AgentInfo, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:agent_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.AgentInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
