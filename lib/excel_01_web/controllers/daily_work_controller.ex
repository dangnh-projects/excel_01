defmodule Excel01Web.DailyWorkController do
  use Excel01Web, :controller
  alias Excel01.Src.DaiLyWork.DailyWorks

  def index(conn, _params) do
    daily_works = DailyWorks.get_daily_work()
    render(conn, "index.html", daily_works: daily_works)
  end
end
