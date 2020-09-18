defmodule Excel01Web.Exports.PostController do
  use Excel01Web, :controller
  alias Excel01.Posters
  alias Excel01.Src.Employee.Employees

  def index(conn, params) do
    posts = Posters.list_posts()
    employees = Employees.list_all_employees()
    IO.inspect "------------------------------------"
    IO.inspect params
    conn
    |> render("report.xlsx", %{posts: posts, employees: employees})
  end
end
