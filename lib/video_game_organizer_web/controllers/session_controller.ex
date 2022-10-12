defmodule VideoGameOrganizerWeb.SessionController do
  use VideoGameOrganizerWeb, :controller

  alias VideoGameOrganizer.Auth
  alias VideoGameOrganizer.User

  def new(conn, _param) do
    # Login
  end

  def create(conn, %{"auth" => %{"email" => email, "password" => password}}) do
    case Auth.authenticate(email, password) do
      %User{} = user ->
        # Create our session
        # Creating our cookie
        # Puts cookie into session
      nil ->
        # Redirect back to the login page with a message
    end
  end
end
