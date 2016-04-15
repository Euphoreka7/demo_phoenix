defmodule DemoPhoenix.QuoteController do
  use DemoPhoenix.Web, :controller

  alias DemoPhoenix.Router
  alias DemoPhoenix.Quote
  import DemoPhoenix.Router.Helpers

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  def index(conn, _params) do
    conn
    |> assign(:quotes, Repo.all(Quote))
    |> render("index.html")
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"quote" => %{"saying" => saying, "author" => author}}) do
    q = %Quote{saying: saying,  author: author}
    Repo.insert(q)
    redirect conn, to: quote_path(conn, :index)
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    conn
    |> assign(:quote, Repo.get(Quote, id))
    |> render("show.html")
  end

  def edit(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    conn
    |> assign(:quote, Repo.get(Quote, id))
    |> render("edit.html")
  end

  def update(conn, %{"id" => id, "quote" => quote_params}) do
    q = Repo.get!(Quote, id)
    changeset = Quote.changeset(q, quote_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Quote updated successfully.")
      |> redirect(to: quote_path(conn, :show, q.id))
    else
      render(conn, "edit.html", quote: q, changeset: changeset)
    end
  end
end
