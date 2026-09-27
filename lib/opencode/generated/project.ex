defmodule OpenCode.Generated.Project do
  @moduledoc """
  Provides API endpoints related to project
  """

  @default_client OpenCode.Client

  @doc """
  List projects

  List known projects.
  """
  @spec project_list(opts :: keyword) ::
          {:ok, [OpenCode.Generated.Project.t()]}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def project_list(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Project, :project_list},
      url: "/api/project",
      method: :get,
      response: [
        {200, [{OpenCode.Generated.Project, :t}]},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update project

  Update the project canonical directory, display metadata, and workspace commands.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec project_update(projectID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Project.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ProjectNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def project_update(projectID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectID: projectID, body: body],
      call: {OpenCode.Generated.Project, :project_update},
      url: "/api/project/#{projectID}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Project, :t}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ProjectNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          canonical: String.t(),
          commands: OpenCode.Generated.ProjectCommands.t() | nil,
          icon: OpenCode.Generated.ProjectIcon.t() | nil,
          id: String.t(),
          name: String.t() | nil,
          sandboxes: [String.t()],
          time: OpenCode.Generated.ProjectTime.t(),
          vcs: String.t() | nil
        }

  defstruct [:canonical, :commands, :icon, :id, :name, :sandboxes, :time, :vcs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      canonical: :string,
      commands: {OpenCode.Generated.ProjectCommands, :t},
      icon: {OpenCode.Generated.ProjectIcon, :t},
      id: :string,
      name: :string,
      sandboxes: [:string],
      time: {OpenCode.Generated.ProjectTime, :t},
      vcs: :string
    ]
  end
end
