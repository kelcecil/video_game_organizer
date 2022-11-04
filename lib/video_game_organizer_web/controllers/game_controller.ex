defmodule VideoGameOrganizerWeb.GameController do
  use VideoGameOrganizerWeb, :controller

  alias VideoGameOrganizer.Repo
  alias VideoGameOrganizer.Game
  alias VideoGameOrganizer.User

  plug :get_user_from_session

  def new(conn, _params) do

  end

  def create(conn, _params) do

  end

  def edit(conn, params) do
    game = Repo.get(Game, params["id"])

    authenticated_user_id = conn.assigns.authenticated_user.id
    game_changeset = Ecto.Changeset.change(game)

    case game.user_id do
      ^authenticated_user_id -> render(conn, "edit.html", unauthorized: false, game_id: game.id, changeset: game_changeset)
      _ -> render(conn, "edit.html", unauthorized: true)
    end
  end

  def update(conn, params) do
    game = Repo.get(Game, params["id"])
    changeset = Game.changeset(game, params["game"])

    case changeset.valid? do
      true ->
        Repo.update!(changeset)
        redirect(conn, to: Routes.dashboard_path(conn, :index))

      false ->
        # Redirect back to the edit and show errors.
        redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
  end

  def index(conn, _params) do
    games =
      Game
      |> Repo.all()
      |> Repo.preload([:user])

    render(conn, "index.html", games: games)
  end

  def get_user_from_session(conn, _opts) do
    token = get_session(conn, :user_token)
    {:ok, user_id} = Phoenix.Token.verify(VideoGameOrganizerWeb.Endpoint, "THIS_IS_A_BAD_SECRET", token)
    user =
      User
      |> Repo.get(user_id)
      |> Repo.preload([:games])
    assign(conn, :authenticated_user, user)
  end
end
