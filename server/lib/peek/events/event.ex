defmodule Peek.Events.Event do
  @moduledoc """
  Auto-generated.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "peek_events" do
    field(:duration, :integer)
    field(:start, :naive_datetime)
    field(:title, :string)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :start, :duration])
    |> validate_required([:title, :start, :duration])
  end
end
