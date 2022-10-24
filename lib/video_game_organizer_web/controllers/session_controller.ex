defmodule VideoGameOrganizerWeb.SessionController do
  use VideoGameOrganizerWeb, :controller

  alias VideoGameOrganizer.Auth
  alias VideoGameOrganizer.User

  def new(conn, _param) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"auth" => %{"email" => email, "password" => password}} = params) do
    IO.inspect(params)

    case Auth.authenticate(email, password) do
      %User{} = user ->
        token =
          Phoenix.Token.sign(VideoGameOrganizerWeb.Endpoint, "THIS_IS_A_BAD_SECRET", user.id)

        # Put a token into temporary session
        conn
        |> configure_session(renew: true)
        |> clear_session()
        |> put_session(:user_token, token)
        # Does not exist yet.
        |> redirect(to: Routes.dashboard_path(conn, :index))

      nil ->
        render(conn, "new.html", error_message: "Invalid email/password. Please try again.")
    end
  end
end
