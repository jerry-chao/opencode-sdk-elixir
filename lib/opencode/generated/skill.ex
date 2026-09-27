defmodule OpenCode.Generated.Skill do
  @moduledoc """
  Provides API endpoint related to skill
  """

  @default_client OpenCode.Client

  @type skill_list_200_json_resp :: %{
          data: [OpenCode.Generated.SkillInfo.t()],
          location: OpenCode.Generated.LocationPublicRef.t()
        }

  @doc """
  List skills

  Retrieve currently registered skills.

  ## Options

    * `location`

  """
  @spec skill_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.Skill.skill_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def skill_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:location])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Skill, :skill_list},
      url: "/api/skill",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Skill, :skill_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:skill_list_200_json_resp) do
    [
      data: [{OpenCode.Generated.SkillInfo, :t}],
      location: {OpenCode.Generated.LocationPublicRef, :t}
    ]
  end
end
