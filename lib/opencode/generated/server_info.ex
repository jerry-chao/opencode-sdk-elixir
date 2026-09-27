defmodule OpenCode.Generated.ServerInfo do
  @moduledoc """
  Provides struct and type for a ServerInfo
  """

  @type t :: %__MODULE__{
          paths: OpenCode.Generated.ServerInfoPaths.t(),
          pid: integer,
          urls: [String.t()],
          version: String.t()
        }

  defstruct [:paths, :pid, :urls, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      paths: {OpenCode.Generated.ServerInfoPaths, :t},
      pid: :integer,
      urls: [:string],
      version: :string
    ]
  end
end
