defmodule ArtPage.Repo do
  use Ecto.Repo,
    otp_app: :art_page,
    adapter: Ecto.Adapters.Postgres
end
