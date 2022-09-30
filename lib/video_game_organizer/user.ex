defmodule VideoGameOrganizer.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias VideoGameOrganizer.Game

  schema "users" do
    field :email, :string
    field :password_hash, :string, redact: true
    field :password, :string, virtual: true
    field :name, :string
    field :phone_number, :string

    has_many :games, Game

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password, :name, :phone_number])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 12)
    |> maybe_put_password_hash()
  end

  defp maybe_put_password_hash(%Ecto.Changeset{valid?: true} = changeset) do
    case get_change(changeset, :password) do
      nil ->
        changeset

      password ->
        hashed_password = Argon2.hash_pwd_salt(password)
        put_change(changeset, :password_hash, hashed_password)
    end
  end

  defp maybe_put_password_hash(changeset) do
    changeset
  end
end
