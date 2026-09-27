defmodule OpenCode.Generated.Vcs do
  @moduledoc """
  Provides API endpoints related to vcs
  """

  @default_client OpenCode.Client

  @type vcs_base_200_json_resp :: %{
          data: OpenCode.Generated.VcsBase.t() | nil,
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  VCS review base

  Infer a local review base from named branch creation history, or the repository default only when currently on that branch. Returns null before the first commit or when the provider lacks base metadata; ambiguous Git history requires an explicit base on diff requests.

  ## Options

    * `location`

  """
  @spec vcs_base(opts :: keyword) ::
          {:ok, OpenCode.Generated.Vcs.vcs_base_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def vcs_base(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Vcs, :vcs_base},
      url: "/api/vcs/base",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Vcs, :vcs_base_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type vcs_branch_list_200_json_resp :: %{
          data: [String.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  VCS branches

  List local and remote branches available at the requested location.

  ## Options

    * `location`
    * `search`
    * `limit`

  """
  @spec vcs_branch_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Vcs.vcs_branch_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def vcs_branch_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :location, :search])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Vcs, :vcs_branch_list},
      url: "/api/vcs/branch",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Vcs, :vcs_branch_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type vcs_diff_200_json_resp :: %{
          data: [OpenCode.Generated.FileDiffInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  VCS diff

  Diff HEAD to the working copy (working), the base merge-base to the working copy (branch), or the base merge-base to HEAD (committed). Omitting base preserves repository-default comparison; supplying it overrides the comparison without saving it.

  ## Options

    * `location`
    * `mode`
    * `base`
    * `context`

  """
  @spec vcs_diff(opts :: keyword) ::
          {:ok, OpenCode.Generated.Vcs.vcs_diff_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def vcs_diff(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:base, :context, :location, :mode])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Vcs, :vcs_diff},
      url: "/api/vcs/diff",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Vcs, :vcs_diff_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type vcs_get_200_json_resp :: %{
          data: OpenCode.Generated.VcsInfo.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  VCS info

  Get current and default branch information for the requested location.

  ## Options

    * `location`

  """
  @spec vcs_get(opts :: keyword) ::
          {:ok, OpenCode.Generated.Vcs.vcs_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def vcs_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Vcs, :vcs_get},
      url: "/api/vcs",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Vcs, :vcs_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type vcs_status_200_json_resp :: %{
          data: [OpenCode.Generated.VcsFileStatus.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  VCS status

  List uncommitted working-copy changes relative to the requested location.

  ## Options

    * `location`

  """
  @spec vcs_status(opts :: keyword) ::
          {:ok, OpenCode.Generated.Vcs.vcs_status_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def vcs_status(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Vcs, :vcs_status},
      url: "/api/vcs/status",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Vcs, :vcs_status_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:vcs_base_200_json_resp) do
    [
      data: {:union, [{OpenCode.Generated.VcsBase, :t}, :null]},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:vcs_branch_list_200_json_resp) do
    [data: [:string], location: {OpenCode.Generated.LocationPublicRef, :t}]
  end

  def __fields__(:vcs_diff_200_json_resp) do
    [
      data: [{OpenCode.Generated.FileDiffInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:vcs_get_200_json_resp) do
    [data: {OpenCode.Generated.VcsInfo, :t}, location: {OpenCode.Generated.LocationPublicRef, :t}]
  end

  def __fields__(:vcs_status_200_json_resp) do
    [
      data: [{OpenCode.Generated.VcsFileStatus, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
