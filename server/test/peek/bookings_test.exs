defmodule Peek.BookingsTest do
  use Peek.DataCase, async: true

  alias Peek.Events
  alias Peek.Bookings

  setup do
    event =
      Events.create_event(%{title: "wine factory", duration: 30, start: ~N[2021-01-01 20:00:00]})

    {:ok, event: event}
  end

  test "can create a booking", context do
    %{event: event} = context

    result = Bookings.create_booking(event.id, %{first_name: "John", last_name: "Smith"})

    assert {:ok, booking} = result
    assert %{first_name: "John", last_name: "Smith"} = booking
  end

  test "can create a booking and query bookings for that event", context do
    %{event: event} = context
    Bookings.create_booking(event.id, %{first_name: "John", last_name: "Smith"})

    bookings = Bookings.get_bookings(event.id)

    assert {:ok, [booking]} = bookings
    assert %{first_name: "John", last_name: "Smith"} = booking
  end

  test "can't create a booking if the event doesn't exist" do
    result = Bookings.create_booking(1042, %{first_name: "John", last_name: "Smith"})

    assert {:error, _} = result
  end
end
