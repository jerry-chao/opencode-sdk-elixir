defmodule OpenCode.Generated.Filesystem do
  @moduledoc """
  Provides API endpoints related to filesystem
  """

  @default_client OpenCode.Client

  @type experimental_fs_write_200_json_resp :: %{
          data: OpenCode.Generated.FileSystemWrite.t(),
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Write file

  Write the raw request body to an absolute path or a path relative to the requested location, creating parent directories, and return the resolved absolute path. Unlike read, the target is not confined to the location. Experimental: may change without compatibility guarantees.

  ## Options

    * `location`
    * `path`

  ## Request Body

  **Content Types**: `application/octet-stream`
  """
  @spec experimental_fs_write(body :: binary, opts :: keyword) ::
          {:ok, OpenCode.Generated.Filesystem.experimental_fs_write_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_fs_write(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location, :path])

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Filesystem, :experimental_fs_write},
      url: "/api/experimental/fs/write",
      body: body,
      method: :post,
      query: query,
      request: [{"application/octet-stream", {:string, "binary"}}],
      response: [
        {200, {OpenCode.Generated.Filesystem, :experimental_fs_write_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type fs_find_200_json_resp :: %{
          data: [OpenCode.Generated.FileSystemEntry.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  Find files

  Find recursively ranked filesystem entries relative to the requested location.

  ## Options

    * `location`
    * `query`
    * `type`
    * `limit`

  """
  @spec fs_find(opts :: keyword) ::
          {:ok, OpenCode.Generated.Filesystem.fs_find_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def fs_find(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :location, :query, :type])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Filesystem, :fs_find},
      url: "/api/fs/find",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Filesystem, :fs_find_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type fs_list_200_json_resp :: %{
          data: [OpenCode.Generated.FileSystemEntry.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List directory

  List direct children using an absolute path or a path relative to the requested location, including parents and siblings outside its directory. Entry paths remain relative to the requested location; listing does not switch locations.

  ## Options

    * `location`
    * `path`

  """
  @spec fs_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Filesystem.fs_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def fs_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location, :path])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Filesystem, :fs_list},
      url: "/api/fs/list",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Filesystem, :fs_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Read file

  Serve one file relative to the requested location.

  ## Options

    * `location`

  """
  @spec fs_read(opts :: keyword) ::
          {:ok, binary}
          | {:error,
             OpenCode.Generated.FileNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def fs_read(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Filesystem, :fs_read},
      url: "/api/fs/read/*",
      method: :get,
      query: query,
      response: [
        {200, {:string, "binary"}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.FileNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:experimental_fs_write_200_json_resp) do
    [
      data: {OpenCode.Generated.FileSystemWrite, :t},
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:fs_find_200_json_resp) do
    [
      data: [{OpenCode.Generated.FileSystemEntry, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end

  def __fields__(:fs_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.FileSystemEntry, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
