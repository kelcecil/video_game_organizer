defmodule VideoGameOrganizerWeb.GameController do
  use VideoGameOrganizerWeb, :controller

  alias VideoGameOrganizer.Repo
  alias VideoGameOrganizer.Game

  def index(conn, _params) do
    games =
      Game
      |> Repo.all()
      |> Repo.preload([:user])

    render(conn, "index.html", games: games)
  end
end
