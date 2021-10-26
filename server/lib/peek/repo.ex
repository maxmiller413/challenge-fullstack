defmodule Peek.Repo do
  use Ecto.Repo,
    otp_app: :peek,
    adapter: Ecto.Adapters.Postgres
end
