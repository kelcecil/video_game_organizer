defmodule VideoGameOrganizer.Repo do
  use Ecto.Repo,
    otp_app: :video_game_organizer,
    adapter: Ecto.Adapters.Postgres
end
