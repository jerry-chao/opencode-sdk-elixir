defmodule OpenCode.Generated.McpResourceCatalog do
  @moduledoc """
  Provides struct and type for a McpResourceCatalog
  """

  @type t :: %__MODULE__{
          resources: [OpenCode.Generated.McpResource.t()],
          templates: [OpenCode.Generated.McpResourceTemplate.t()]
        }

  defstruct [:resources, :templates]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      resources: [{OpenCode.Generated.McpResource, :t}],
      templates: [{OpenCode.Generated.McpResourceTemplate, :t}]
    ]
  end
end
