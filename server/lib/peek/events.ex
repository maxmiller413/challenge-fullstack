defmodule Peek.Events do
  @moduledoc """
  The Planner context.
  """

  import Ecto.Query, warn: false
  alias Peek.Repo

  alias Peek.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_uvents()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Create a new Event.

  ## Examples

      iex> create_event(%{title: "event", "duration": 30, "start": ~N[2000-01-01 23:00:07]})
      [%Event{}, ...]

  """
  def create_event(attrs) do
    event = %Event{}

    Map.merge(event, attrs)
    |> Repo.insert!()
  end

  @doc """
    Same as get_event
    Doesn't need to raise an error.
  """
  def get_event(id), do: Repo.get(Event, id)
end
