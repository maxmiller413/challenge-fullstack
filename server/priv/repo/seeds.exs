# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Peek.Repo.insert!(%Peek.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Peek.Events

{:ok, ndt} = NaiveDateTime.new(Date.utc_today(), Time.new!(0, 0, 0, 0))
schedule = Cocktail.Schedule.new(ndt)

schedule =
  Cocktail.Schedule.add_recurrence_rule(schedule, :weekly,
    interval: 1,
    days: [:monday, :tuesday, :wednesday, :thursday, :friday],
    hours: [10, 14, 16]
  )

attrs = %{
  title: "Wine tour",
  duration: 60
}

stream = Cocktail.Schedule.occurrences(schedule)

Enum.take(stream, 300)
|> Enum.each(fn start ->
  Map.put(attrs, :start, start)
  |> Events.create_event()
end)
