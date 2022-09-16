defmodule VideoGameOrganizer.Repo.Migrations.CreateInitialTables do
  use Ecto.Migration

  def change do
    create table("users") do
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :name, :string
      add :phone_number, :string

      timestamps()
    end

    create index("users", [:email])
  end
end
