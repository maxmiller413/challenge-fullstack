defmodule Calevents.Repo.Migrations.CreateUvents do
  use Ecto.Migration

  def change do
    create table(:uvents) do
      add(:title, :string)
      add(:start, :naive_datetime)
      add(:duration, :integer)

      timestamps()
    end
  end
end
