defmodule VideoGameOrganizer.Repo.Migrations.AddGamesTable do
  use Ecto.Migration

  def change do
    create table("games") do
      add :title, :string
      add :has_played, :boolean

      timestamps()
    end
  end
end
