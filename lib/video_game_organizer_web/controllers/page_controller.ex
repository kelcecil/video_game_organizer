defmodule VideoGameOrganizerWeb.PageController do
  use VideoGameOrganizerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
