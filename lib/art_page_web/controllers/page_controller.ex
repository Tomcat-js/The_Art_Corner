defmodule ArtPageWeb.PageController do
  use ArtPageWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
