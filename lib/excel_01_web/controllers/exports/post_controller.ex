defmodule Excel01Web.Exports.PostController do
  use Excel01Web, :controller
  alias Excel01.Posters

  def index(conn, _params) do
    posts = Posters.list_posts()
    conn
    |> render("report.xlsx", %{posts: posts})
  end
end
