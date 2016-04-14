defmodule DemoPhoenix.QuoteController do
  use DemoPhoenix.Web, :controller

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end
end
