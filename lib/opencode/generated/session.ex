defmodule OpenCode.Generated.Session do
  @moduledoc """
  Provides API endpoints related to session
  """

  @default_client OpenCode.Client

  @type experimental_session_export_200_json_resp :: %{
          data: OpenCode.Generated.SessionTransferData.t()
        }

  @doc """
  Export session

  Export a complete projected session transcript.

  ## Options

    * `sanitize`

  """
  @spec experimental_session_export(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.experimental_session_export_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.UnknownErrorEncoded.t()}
  def experimental_session_export(sessionID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:sanitize])

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :experimental_session_export},
      url: "/api/experimental/session/#{sessionID}/export",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Session, :experimental_session_export_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {500, {OpenCode.Generated.UnknownErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type experimental_session_import_200_json_resp :: %{data: OpenCode.Generated.SessionInfo.t()}

  @doc """
  Import session

  Import a projected session transcript at the requested location. If parentID is supplied, the parent session must already exist; import parents before children.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_session_import(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.experimental_session_import_200_json_resp()}
          | {:error,
             OpenCode.Generated.ConflictErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_import(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Session, :experimental_session_import},
      url: "/api/experimental/session/import",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :experimental_session_import_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.ConflictErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type experimental_session_instructions_entry_list_200_json_resp :: %{
          data: [OpenCode.Generated.InstructionEntryInfo.t()]
        }

  @doc """
  List instruction entries

  List API-managed instruction entries attached to the session.
  """
  @spec experimental_session_instructions_entry_list(sessionID :: String.t(), opts :: keyword) ::
          {:ok,
           OpenCode.Generated.Session.experimental_session_instructions_entry_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_instructions_entry_list(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :experimental_session_instructions_entry_list},
      url: "/api/experimental/session/#{sessionID}/instructions/entries",
      method: :get,
      response: [
        {200,
         {OpenCode.Generated.Session, :experimental_session_instructions_entry_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Put instruction entry

  Attach or replace one durable instruction entry. Changes announce as updates at the next step boundary.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_session_instructions_entry_put(
          sessionID :: String.t(),
          key :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.InstructionEntryValueTooLargeErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_instructions_entry_put(sessionID, key, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, key: key, body: body],
      call: {OpenCode.Generated.Session, :experimental_session_instructions_entry_put},
      url: "/api/experimental/session/#{sessionID}/instructions/entries/#{key}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {413, {OpenCode.Generated.InstructionEntryValueTooLargeErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove instruction entry

  Remove one instruction entry; the removal is announced to the model at the next step boundary.
  """
  @spec experimental_session_instructions_entry_remove(
          sessionID :: String.t(),
          key :: String.t(),
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_instructions_entry_remove(sessionID, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, key: key],
      call: {OpenCode.Generated.Session, :experimental_session_instructions_entry_remove},
      url: "/api/experimental/session/#{sessionID}/instructions/entries/#{key}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Activate skill

  Activate a skill for a session by appending a skill message and resuming execution.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec experimental_session_skill(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.SkillNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_skill(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :experimental_session_skill},
      url: "/api/experimental/session/#{sessionID}/skill",
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
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SkillNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @type experimental_session_stats_200_json_resp :: %{
          data: OpenCode.Generated.SessionStatsInfo.t()
        }

  @doc """
  Get session statistics

  Aggregate local session activity, usage, and tool reliability for a time range.

  ## Options

    * `from`
    * `to`
    * `project`
    * `timezone`
    * `tools`

  """
  @spec experimental_session_stats(opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.experimental_session_stats_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_stats(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :project, :timezone, :to, :tools])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Session, :experimental_session_stats},
      url: "/api/experimental/session/stats",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Session, :experimental_session_stats_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Wait for session

  Wait for a session agent loop to become idle.
  """
  @spec experimental_session_wait(sessionID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def experimental_session_wait(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :experimental_session_wait},
      url: "/api/experimental/session/#{sessionID}/wait",
      method: :post,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_active_200_json_resp :: %{data: map}

  @doc """
  List active sessions

  Retrieve foreground Session drains currently owned by this OpenCode process. Sessions absent from the result are inactive.
  """
  @spec session_active(opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_active_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_active(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Session, :session_active},
      url: "/api/session/active",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_active_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Background blocking session tools

  Move active foreground backgroundable tools for this session into background observation. Idle requests are a no-op.
  """
  @spec session_background(sessionID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_background(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_background},
      url: "/api/session/#{sessionID}/background",
      method: :post,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Run command

  Execute a slash command callback immediately.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_command(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.CommandExecutionErrorEncoded.t()
             | OpenCode.Generated.CommandNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_command(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_command},
      url: "/api/session/#{sessionID}/command",
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
            {OpenCode.Generated.CommandNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}},
        {500, {OpenCode.Generated.CommandExecutionErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_compact_200_json_resp :: %{data: OpenCode.Generated.SessionInboxCompaction.t()}

  @doc """
  Compact session

  Durably admit a session compaction request. Steers by default: it runs at the next step boundary instead of waiting behind queued prompts.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_compact(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_compact_200_json_resp()}
          | {:error,
             OpenCode.Generated.ConflictErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_compact(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_compact},
      url: "/api/session/#{sessionID}/compact",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :session_compact_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.ConflictErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_context_200_json_resp :: %{
          data: [
            map
            | OpenCode.Generated.SessionMessageAgentSelected.t()
            | OpenCode.Generated.SessionMessageAssistant.t()
            | OpenCode.Generated.SessionMessageIdle.t()
            | OpenCode.Generated.SessionMessageLocationSwitched.t()
            | OpenCode.Generated.SessionMessageModelSelected.t()
            | OpenCode.Generated.SessionMessageShell.t()
            | OpenCode.Generated.SessionMessageSkill.t()
            | OpenCode.Generated.SessionMessageSynthetic.t()
            | OpenCode.Generated.SessionMessageSystem.t()
            | OpenCode.Generated.SessionMessageUser.t()
          ]
        }

  @doc """
  Get session context

  Retrieve the active context messages for a session (all messages after the last compaction).
  """
  @spec session_context(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_context_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.UnknownErrorEncoded.t()}
  def session_context(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_context},
      url: "/api/session/#{sessionID}/context",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_context_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {500, {OpenCode.Generated.UnknownErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_create_200_json_resp :: %{data: OpenCode.Generated.SessionInfo.t()}

  @doc """
  Create session

  Create a session at the requested location.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_create(body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_create_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenCode.Generated.Session, :session_create},
      url: "/api/session",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :session_create_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_diff_200_json_resp :: %{data: [OpenCode.Generated.FileDiffInfo.t()]}

  @doc """
  Diff session turns

  Structured per-file diffs of the files a turn changed. A turn runs from the first prompt after the session was last idle until its next idle marker, so prompts steered in while it was busy belong to the same turn; `to` extends the range through a later turn. Compares the range's first recorded snapshot with its last; a step still running in the active session compares against the working copy. Ranges that span a location change are rejected. In sessions without any idle marker, a prompt's turn spans until the next user message.

  ## Options

    * `from`
    * `to`
    * `context`

  """
  @spec session_diff(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_diff_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.MessageNotFoundErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.UnknownErrorEncoded.t()}
  def session_diff(sessionID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:context, :from, :to])

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_diff},
      url: "/api/session/#{sessionID}/diff",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Session, :session_diff_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.MessageNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}},
        {500, {OpenCode.Generated.UnknownErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set session environment

  Replace the process environment used by local shell commands for this session.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_environment(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_environment(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_environment},
      url: "/api/session/#{sessionID}/environment",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_fork_200_json_resp :: %{data: OpenCode.Generated.SessionInfo.t()}

  @doc """
  Fork session

  Create a child session by copying projected history before a message. Omit before to copy the full history.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_fork(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_fork_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.MessageNotFoundErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_fork(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_fork},
      url: "/api/session/#{sessionID}/fork",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :session_fork_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.MessageNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Cancel form

  Cancel a pending form.
  """
  @spec session_form_cancel(sessionID :: String.t(), formID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.FormAlreadySettledErrorEncoded.t()
             | OpenCode.Generated.FormNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_form_cancel(sessionID, formID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, formID: formID],
      call: {OpenCode.Generated.Session, :session_form_cancel},
      url: "/api/session/#{sessionID}/form/#{formID}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.FormNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}},
        {409, {OpenCode.Generated.FormAlreadySettledErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_form_create_200_json_resp :: %{data: OpenCode.Generated.FormInfo.t()}

  @doc """
  Create session form

  Create a form for a session.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_form_create(
          sessionID :: String.t(),
          body :: OpenCode.Generated.FormCreatePayload.t(),
          opts :: keyword
        ) ::
          {:ok, OpenCode.Generated.Session.session_form_create_200_json_resp()}
          | {:error,
             OpenCode.Generated.ConflictErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_form_create(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_form_create},
      url: "/api/session/#{sessionID}/form",
      body: body,
      method: :post,
      request: [{"application/json", {OpenCode.Generated.FormCreatePayload, :t}}],
      response: [
        {200, {OpenCode.Generated.Session, :session_form_create_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.ConflictErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_form_get_200_json_resp :: %{data: OpenCode.Generated.FormDetail.t()}

  @doc """
  Get session form

  Retrieve a form and its current state for a session.
  """
  @spec session_form_get(sessionID :: String.t(), formID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_form_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.FormNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_form_get(sessionID, formID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, formID: formID],
      call: {OpenCode.Generated.Session, :session_form_get},
      url: "/api/session/#{sessionID}/form/#{formID}",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_form_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.FormNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @type session_form_list_200_json_resp :: %{data: [OpenCode.Generated.FormInfo.t()]}

  @doc """
  List session forms

  Retrieve pending forms for a session.
  """
  @spec session_form_list(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_form_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_form_list(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_form_list},
      url: "/api/session/#{sessionID}/form",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_form_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reply to form

  Submit an answer to a pending form.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_form_reply(
          sessionID :: String.t(),
          formID :: String.t(),
          body :: OpenCode.Generated.FormReply.t(),
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.FormAlreadySettledErrorEncoded.t()
             | OpenCode.Generated.FormInvalidAnswerErrorEncoded.t()
             | OpenCode.Generated.FormNotFoundErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_form_reply(sessionID, formID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, formID: formID, body: body],
      call: {OpenCode.Generated.Session, :session_form_reply},
      url: "/api/session/#{sessionID}/form/#{formID}/reply",
      body: body,
      method: :post,
      request: [{"application/json", {OpenCode.Generated.FormReply, :t}}],
      response: [
        {204, :null},
        {400,
         {:union,
          [
            {OpenCode.Generated.FormInvalidAnswerErrorEncoded, :t},
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.FormNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}},
        {409, {OpenCode.Generated.FormAlreadySettledErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate text from session context

  Generate transient text from the current session context without mutating session history.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_generate(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.SessionGenerateResponse.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.ServiceUnavailableErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_generate(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_generate},
      url: "/api/session/#{sessionID}/generate",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.SessionGenerateResponse, :t}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {503, {OpenCode.Generated.ServiceUnavailableErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_get_200_json_resp :: %{data: OpenCode.Generated.SessionInfo.t()}

  @doc """
  Get session

  Retrieve a session by ID.
  """
  @spec session_get(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_get(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_get},
      url: "/api/session/#{sessionID}",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Cancel inbox input

  Cancel an inbox item that has not yet been delivered. Unavailable items are a no-op.
  """
  @spec session_inbox_cancel(sessionID :: String.t(), inboxID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_inbox_cancel(sessionID, inboxID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, inboxID: inboxID],
      call: {OpenCode.Generated.Session, :session_inbox_cancel},
      url: "/api/session/#{sessionID}/inbox/#{inboxID}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_inbox_list_200_json_resp :: %{
          data: [
            OpenCode.Generated.SessionInboxCompaction.t()
            | OpenCode.Generated.SessionInboxMove.t()
            | OpenCode.Generated.SessionInboxSynthetic.t()
            | OpenCode.Generated.SessionInboxUser.t()
          ]
        }

  @doc """
  List session inbox

  List durable enqueued session work not yet delivered, ordered by enqueue sequence. Includes user, synthetic, compaction, and move items.
  """
  @spec session_inbox_list(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_inbox_list_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_inbox_list(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_inbox_list},
      url: "/api/session/#{sessionID}/inbox",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_inbox_list_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update inbox item

  Change a pending inbox item's delivery mode. Steering wakes session execution.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_inbox_update(
          sessionID :: String.t(),
          inboxID :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             OpenCode.Generated.ConflictErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_inbox_update(sessionID, inboxID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, inboxID: inboxID, body: body],
      call: {OpenCode.Generated.Session, :session_inbox_update},
      url: "/api/session/#{sessionID}/inbox/#{inboxID}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.ConflictErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Interrupt session execution

  Interrupt active execution owned by this OpenCode process. Returns interrupted=true when an active execution was interrupted and false for the idle no-op. When resume=true, execution resumes pending steering input and next-in-line control items (manual compaction, moves) while queued prompts remain parked.

  ## Options

    * `resume`

  """
  @spec session_interrupt(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.SessionInterruptResponse.t()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_interrupt(sessionID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:resume])

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_interrupt},
      url: "/api/session/#{sessionID}/interrupt",
      method: :post,
      query: query,
      response: [
        {200, {OpenCode.Generated.SessionInterruptResponse, :t}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List sessions

  Retrieve sessions in the requested order. Items keep that order across pages; use cursor.next or cursor.previous to move through the ordered list.

  ## Options

    * `limit`
    * `order`
    * `search`
    * `parentID`
    * `directory`
    * `project`
    * `subpath`
    * `cursor`

  """
  @spec session_list(opts :: keyword) ::
          {:ok, OpenCode.Generated.SessionsResponse.t()}
          | {:error,
             OpenCode.Generated.InvalidCursorErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :cursor,
        :directory,
        :limit,
        :order,
        :parentID,
        :project,
        :search,
        :subpath
      ])

    client.request(%{
      args: [],
      call: {OpenCode.Generated.Session, :session_list},
      url: "/api/session",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.SessionsResponse, :t}},
        {400,
         {:union,
          [
            {OpenCode.Generated.InvalidCursorErrorEncoded, :t},
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_log_200__resp :: %{data: String.t(), event: String.t(), id: String.t() | nil}

  @doc """
  Read the session log

  Experimental durable session event log. Reads events after an exclusive aggregate sequence and continues with live events when follow=true.

  ## Options

    * `after`
    * `follow`

  """
  @spec session_log(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_log_200__resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_log(sessionID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :follow])

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_log},
      url: "/api/experimental/session/#{sessionID}/log",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.Session, :session_log_200__resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_message_get_200_json_resp :: %{
          data:
            map
            | OpenCode.Generated.SessionMessageAgentSelected.t()
            | OpenCode.Generated.SessionMessageAssistant.t()
            | OpenCode.Generated.SessionMessageIdle.t()
            | OpenCode.Generated.SessionMessageLocationSwitched.t()
            | OpenCode.Generated.SessionMessageModelSelected.t()
            | OpenCode.Generated.SessionMessageShell.t()
            | OpenCode.Generated.SessionMessageSkill.t()
            | OpenCode.Generated.SessionMessageSynthetic.t()
            | OpenCode.Generated.SessionMessageSystem.t()
            | OpenCode.Generated.SessionMessageUser.t()
        }

  @doc """
  Get session message

  Retrieve one projected message owned by the Session.
  """
  @spec session_message_get(sessionID :: String.t(), messageID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_message_get_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.MessageNotFoundErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_message_get(sessionID, messageID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, messageID: messageID],
      call: {OpenCode.Generated.Session, :session_message_get},
      url: "/api/session/#{sessionID}/message/#{messageID}",
      method: :get,
      response: [
        {200, {OpenCode.Generated.Session, :session_message_get_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.MessageNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Get session messages

  Retrieve projected messages for a session, optionally filtered by type. Items keep the requested order across pages; use cursor.next or cursor.previous to move through the ordered timeline, passing the same type filter on each page.

  ## Options

    * `limit`
    * `order`
    * `cursor`
    * `type`

  """
  @spec session_message_list(sessionID :: String.t(), opts :: keyword) ::
          {:ok, OpenCode.Generated.SessionMessagesResponse.t()}
          | {:error,
             OpenCode.Generated.InvalidCursorErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.UnknownErrorEncoded.t()}
  def session_message_list(sessionID, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :order, :type])

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_message_list},
      url: "/api/session/#{sessionID}/message",
      method: :get,
      query: query,
      response: [
        {200, {OpenCode.Generated.SessionMessagesResponse, :t}},
        {400,
         {:union,
          [
            {OpenCode.Generated.InvalidCursorErrorEncoded, :t},
            {OpenCode.Generated.InvalidRequestErrorEncoded, :t}
          ]}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {500, {OpenCode.Generated.UnknownErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Move session

  Move a session to another project directory at the requested delivery boundary.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_move(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_move(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_move},
      url: "/api/session/#{sessionID}/move",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_prompt_200_json_resp :: %{data: OpenCode.Generated.SessionInboxUser.t()}

  @doc """
  Send message

  Durably admit one session input and schedule agent-loop execution unless resume is false.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_prompt(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_prompt_200_json_resp()}
          | {:error,
             OpenCode.Generated.ConflictErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_prompt(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_prompt},
      url: "/api/session/#{sessionID}/prompt",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :session_prompt_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.ConflictErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete session

  Delete a session and its child sessions.
  """
  @spec session_remove(sessionID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_remove(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_remove},
      url: "/api/session/#{sessionID}",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Clear staged revert
  """
  @spec session_revert_clear(sessionID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionBusyErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.UnknownErrorEncoded.t()}
  def session_revert_clear(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_revert_clear},
      url: "/api/session/#{sessionID}/revert",
      method: :delete,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.SessionBusyErrorEncoded, :t}},
        {500, {OpenCode.Generated.UnknownErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Commit staged revert
  """
  @spec session_revert_commit(sessionID :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionBusyErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_revert_commit(sessionID, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID],
      call: {OpenCode.Generated.Session, :session_revert_commit},
      url: "/api/session/#{sessionID}/revert/commit",
      method: :post,
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.SessionBusyErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_revert_stage_200_json_resp :: %{data: OpenCode.Generated.SessionRevert.t()}

  @doc """
  Stage session revert

  Stage or move a reversible session boundary and optionally apply its file changes.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_revert_stage(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_revert_stage_200_json_resp()}
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.MessageNotFoundErrorEncoded.t()
             | OpenCode.Generated.SessionBusyErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()
             | OpenCode.Generated.UnknownErrorEncoded.t()}
  def session_revert_stage(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_revert_stage},
      url: "/api/session/#{sessionID}/revert/stage",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :session_revert_stage_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404,
         {:union,
          [
            {OpenCode.Generated.MessageNotFoundErrorEncoded, :t},
            {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}
          ]}},
        {409, {OpenCode.Generated.SessionBusyErrorEncoded, :t}},
        {500, {OpenCode.Generated.UnknownErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Run shell command

  Execute one shell command in the session's working directory. Emits a shell.started event before execution and a shell.ended event with the merged output after.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_shell(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_shell(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_shell},
      url: "/api/session/#{sessionID}/shell",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Switch session agent

  Switch the agent used by subsequent provider turns.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_switch_agent(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_switch_agent(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_switch_agent},
      url: "/api/session/#{sessionID}/agent",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Switch session model

  Switch the model used by subsequent provider turns.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_switch_model(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_switch_model(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_switch_model},
      url: "/api/session/#{sessionID}/model",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @type session_synthetic_200_json_resp :: %{data: OpenCode.Generated.SessionInboxSynthetic.t()}

  @doc """
  Add synthetic message

  Durably admit synthetic session input and schedule execution unless resume is false.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_synthetic(sessionID :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenCode.Generated.Session.session_synthetic_200_json_resp()}
          | {:error,
             OpenCode.Generated.ConflictErrorEncoded.t()
             | OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_synthetic(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_synthetic},
      url: "/api/session/#{sessionID}/synthetic",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenCode.Generated.Session, :session_synthetic_200_json_resp}},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}},
        {409, {OpenCode.Generated.ConflictErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update session

  Update mutable session properties.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_update(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_update(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_update},
      url: "/api/session/#{sessionID}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  View session

  Mark the idle transition observed by the viewer as viewed.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec session_view(sessionID :: String.t(), body :: map, opts :: keyword) ::
          :ok
          | {:error,
             OpenCode.Generated.InvalidRequestErrorEncoded.t()
             | OpenCode.Generated.SessionNotFoundErrorEncoded.t()
             | OpenCode.Generated.UnauthorizedErrorEncoded.t()}
  def session_view(sessionID, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionID: sessionID, body: body],
      call: {OpenCode.Generated.Session, :session_view},
      url: "/api/session/#{sessionID}/view",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
        {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
        {404, {OpenCode.Generated.SessionNotFoundErrorEncoded, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:experimental_session_export_200_json_resp) do
    [data: {OpenCode.Generated.SessionTransferData, :t}]
  end

  def __fields__(:experimental_session_import_200_json_resp) do
    [data: {OpenCode.Generated.SessionInfo, :t}]
  end

  def __fields__(:experimental_session_instructions_entry_list_200_json_resp) do
    [data: [{OpenCode.Generated.InstructionEntryInfo, :t}]]
  end

  def __fields__(:experimental_session_stats_200_json_resp) do
    [data: {OpenCode.Generated.SessionStatsInfo, :t}]
  end

  def __fields__(:session_active_200_json_resp) do
    [data: :map]
  end

  def __fields__(:session_compact_200_json_resp) do
    [data: {OpenCode.Generated.SessionInboxCompaction, :t}]
  end

  def __fields__(:session_context_200_json_resp) do
    [
      data: [
        union: [
          :map,
          {OpenCode.Generated.SessionMessageAgentSelected, :t},
          {OpenCode.Generated.SessionMessageAssistant, :t},
          {OpenCode.Generated.SessionMessageIdle, :t},
          {OpenCode.Generated.SessionMessageLocationSwitched, :t},
          {OpenCode.Generated.SessionMessageModelSelected, :t},
          {OpenCode.Generated.SessionMessageShell, :t},
          {OpenCode.Generated.SessionMessageSkill, :t},
          {OpenCode.Generated.SessionMessageSynthetic, :t},
          {OpenCode.Generated.SessionMessageSystem, :t},
          {OpenCode.Generated.SessionMessageUser, :t}
        ]
      ]
    ]
  end

  def __fields__(:session_create_200_json_resp) do
    [data: {OpenCode.Generated.SessionInfo, :t}]
  end

  def __fields__(:session_diff_200_json_resp) do
    [data: [{OpenCode.Generated.FileDiffInfo, :t}]]
  end

  def __fields__(:session_fork_200_json_resp) do
    [data: {OpenCode.Generated.SessionInfo, :t}]
  end

  def __fields__(:session_form_create_200_json_resp) do
    [data: {OpenCode.Generated.FormInfo, :t}]
  end

  def __fields__(:session_form_get_200_json_resp) do
    [data: {OpenCode.Generated.FormDetail, :t}]
  end

  def __fields__(:session_form_list_200_json_resp) do
    [data: [{OpenCode.Generated.FormInfo, :t}]]
  end

  def __fields__(:session_get_200_json_resp) do
    [data: {OpenCode.Generated.SessionInfo, :t}]
  end

  def __fields__(:session_inbox_list_200_json_resp) do
    [
      data: [
        union: [
          {OpenCode.Generated.SessionInboxCompaction, :t},
          {OpenCode.Generated.SessionInboxMove, :t},
          {OpenCode.Generated.SessionInboxSynthetic, :t},
          {OpenCode.Generated.SessionInboxUser, :t}
        ]
      ]
    ]
  end

  def __fields__(:session_log_200__resp) do
    [data: :string, event: :string, id: {:union, [:string, :null]}]
  end

  def __fields__(:session_message_get_200_json_resp) do
    [
      data:
        {:union,
         [
           :map,
           {OpenCode.Generated.SessionMessageAgentSelected, :t},
           {OpenCode.Generated.SessionMessageAssistant, :t},
           {OpenCode.Generated.SessionMessageIdle, :t},
           {OpenCode.Generated.SessionMessageLocationSwitched, :t},
           {OpenCode.Generated.SessionMessageModelSelected, :t},
           {OpenCode.Generated.SessionMessageShell, :t},
           {OpenCode.Generated.SessionMessageSkill, :t},
           {OpenCode.Generated.SessionMessageSynthetic, :t},
           {OpenCode.Generated.SessionMessageSystem, :t},
           {OpenCode.Generated.SessionMessageUser, :t}
         ]}
    ]
  end

  def __fields__(:session_prompt_200_json_resp) do
    [data: {OpenCode.Generated.SessionInboxUser, :t}]
  end

  def __fields__(:session_revert_stage_200_json_resp) do
    [data: {OpenCode.Generated.SessionRevert, :t}]
  end

  def __fields__(:session_synthetic_200_json_resp) do
    [data: {OpenCode.Generated.SessionInboxSynthetic, :t}]
  end
end
