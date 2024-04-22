defmodule BooksApiWeb.PageController do
  use BooksApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
