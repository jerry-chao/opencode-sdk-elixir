defmodule OpenCode.Generated.Worktree do
  @moduledoc """
  Provides API endpoints related to worktree
  """

  @default_client OpenCode.Client

  @doc """
  Create worktree

  Load the project's canonical configuration, create a local worktree using its selected strategy, then run the project's setup script.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec worktree_create(body :: OpenCode.Generated.WorktreeCreateInput.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.WorktreeInfo.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ProjectNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.WorktreeErrorEncoded.t()}
  def worktree_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Worktree, :worktree_create},
      url: "/api/worktree",
      body: body,
      method: :post,
      request: [{"application/json", {OpenCode.Generated.WorktreeCreateInput, :t}}],
      response: [
        {200, {OpenCode.Generated.WorktreeInfo, :t}},
        {400,
         {:union,
          [
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t},
            {OpenCode.Generated.WorktreeErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ProjectNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List worktrees

  Return the project's saved worktree inventory without loading configuration or running discovery.

  ## Options

    * `projectID`

  """
  @spec worktree_list(opts :: keyword) ::
          {:ok, [OpenCode.Generated.WorktreeDirectory.t()]}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ProjectNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def worktree_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:projectID])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Worktree, :worktree_list},
      url: "/api/worktree",
      method: :get,
      query: query,
      response: [
        {200, [{OpenCode.Generated.WorktreeDirectory, :t}]},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ProjectNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Refresh worktrees

  Load the project's canonical configuration, discover worktrees across known checkout roots using all available strategies, and reconcile saved state.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec worktree_refresh(body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ProjectNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.WorktreeErrorEncoded.t()}
  def worktree_refresh(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Worktree, :worktree_refresh},
      url: "/api/worktree/refresh",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400,
         {:union,
          [
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t},
            {OpenCode.Generated.WorktreeErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ProjectNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove worktree

  Load the project's canonical configuration and remove a saved worktree using its recorded strategy.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec worktree_remove(body :: OpenCode.Generated.WorktreeRemoveInput.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ProjectNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.WorktreeErrorEncoded.t()}
  def worktree_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Worktree, :worktree_remove},
      url: "/api/worktree",
      body: body,
      method: :delete,
      request: [{"application/json", {OpenCode.Generated.WorktreeRemoveInput, :t}}],
      response: [
        {204, :null},
        {400,
         {:union,
          [
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t},
            {OpenCode.Generated.WorktreeErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.ProjectNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end
end
