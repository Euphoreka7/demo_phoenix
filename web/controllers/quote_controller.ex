defmodule DemoPhoenix.QuoteController do
  use DemoPhoenix.Web, :controller

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  def index(conn, _params) do
    conn
    |> assign(:quotes, DemoPhoenix.Repo.all(DemoPhoenix.Quote))
    |> render("index.html")
  end
end
