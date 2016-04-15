defmodule DemoPhoenix.QuoteController do
  use DemoPhoenix.Web, :controller

  alias DemoPhoenix.Router
  alias DemoPhoenix.Quote
  import DemoPhoenix.Router.Helpers

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  def index(conn, _params) do
    quotes = Repo.all(Quote)
    render(conn, "index.html", quotes: quotes)
  end

  def new(conn, _params) do
    changeset = Quote.changeset(%Quote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quote" => quote_params}) do
    changeset = Quote.changeset(%Quote{}, quote_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Quote created successfully.")
      |> redirect(to: quote_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quote = Repo.get!(Quote, id)
    render(conn, "show.html", quote: quote)
  end

  def edit(conn, %{"id" => id}) do
    quote = Repo.get!(Quote, id)
    changeset = Quote.changeset(quote)
    render(conn, "edit.html", quote: quote, changeset: changeset)
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
