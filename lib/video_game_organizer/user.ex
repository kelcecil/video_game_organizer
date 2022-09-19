defmodule VideoGameOrganizer.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string, redact: true
    field :password, :string, virtual: true
    field :name, :string
    field :phone_number, :string

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password, :name, :phone_number])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 12)
  end
end
