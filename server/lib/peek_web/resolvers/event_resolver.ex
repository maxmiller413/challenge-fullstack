defmodule PeekWeb.Resolvers.EventResolver do
  alias Peek.Events

  def events(_, _, _) do
    {:ok, Events.list_events()}
  end
end
