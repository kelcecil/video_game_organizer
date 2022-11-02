defmodule VideoGameOrganizer.Repo.Migrations.AddConsoleAndCoverArt do
  use Ecto.Migration

  def change do
    alter table("games") do
      add :console, :string
      add :cover_art, :string
    end
  end
end
