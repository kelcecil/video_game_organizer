defmodule VideoGameOrganizer.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias VideoGameOrganizer.User

  schema "games" do
    field :title, :string
    field :has_played, :boolean

    # user_id column, user
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(game, params \\ %{}) do
    game
    |> cast(params, [:title, :has_played, :user_id])
    |> validate_length(:title, min: 1)
  end
end
