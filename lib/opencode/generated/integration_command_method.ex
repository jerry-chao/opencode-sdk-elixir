defmodule OpenCode.Generated.IntegrationCommandMethod do
  @moduledoc """
  Provides struct and type for a IntegrationCommandMethod
  """

  @type t :: %__MODULE__{
          command: [String.t()],
          id: String.t(),
          label: String.t(),
          type: String.t()
        }

  defstruct [:command, :id, :label, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [command: [:string], id: :string, label: :string, type: {:const, "command"}]
  end
end
