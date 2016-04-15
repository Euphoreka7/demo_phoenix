defmodule DemoPhoenix.QuoteController do
  use DemoPhoenix.Web, :controller

  alias DemoPhoenix.Router
  import DemoPhoenix.Router.Helpers

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  def index(conn, _params) do
    conn
    |> assign(:quotes, DemoPhoenix.Repo.all(DemoPhoenix.Quote))
    |> render("index.html")
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"quote" => %{"saying" => saying, "author" => author}}) do
    q = %DemoPhoenix.Quote{saying: saying,  author: author}
    Repo.insert(q)
    redirect conn, to: quote_path(conn, :index)
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    conn
    |> assign(:quote, DemoPhoenix.Repo.get(DemoPhoenix.Quote, id))
    |> render("show.html")
  end
end
