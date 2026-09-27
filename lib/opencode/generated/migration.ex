defmodule OpenCode.Generated.Migration do
  @moduledoc """
  Provides API endpoint related to migration
  """

  @default_client OpenCode.Client

  @type experimental_migration_v1_status_200_json_resp :: %{
          error: String.t(),
          progress:
            OpenCode.Generated.Migration.experimental_migration_v1_status_200_json_resp_progress(),
          status: String.t()
        }

  @type experimental_migration_v1_status_200_json_resp_progress :: %{
          denominator: integer | nil,
          label: String.t(),
          numerator: integer | nil
        }

  @doc """
  Get V1 migration status

  Return the progress of the V1 to V2 session history migration.
  """
  @spec experimental_migration_v1_status(opts :: keyword) ::
          {:ok, OpenCode.Generated.Migration.experimental_migration_v1_status_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_migration_v1_status(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Migration, :experimental_migration_v1_status},
      url: "/api/experimental/migration/v1",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Migration, :experimental_migration_v1_status_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:experimental_migration_v1_status_200_json_resp) do
    [
      error: :string,
      progress:
        {OpenCode.Generated.Migration, :experimental_migration_v1_status_200_json_resp_progress},
      status: {:enum, ["completed", "error", "required", "running"]}
    ]
  end

  def __fields__(:experimental_migration_v1_status_200_json_resp_progress) do
    [
      denominator: {:union, [:integer, :null]},
      label: :string,
      numerator: {:union, [:integer, :null]}
    ]
  end
end
