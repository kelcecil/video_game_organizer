defmodule VideoGameOrganizer.Repo.Migrations.AddOwnershipOfGame do
  use Ecto.Migration

  def change do
    alter table("games") do
      add :user_id, references(:users)
    end
  end
end
