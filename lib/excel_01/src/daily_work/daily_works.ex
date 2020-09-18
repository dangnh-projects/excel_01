defmodule Excel01.Src.DaiLyWork.DailyWorks do
  import Ecto.Query, warn: false
  alias Excel01.RepoWorkDays
  alias Excel01.DailyWorks.DailyWork

  def get_daily_work do
    DailyWork
    |> RepoWorkDays.all
  end

  def daily_work_last do
    DailyWork
    |> last
    |> RepoWorkDays.one
  end

  def create_daily_work(attrs \\ %{}) do
    %DailyWork{}
    |> DailyWork.changeset(attrs)
    |> RepoWorkDays.insert()
  end

  def change_daily_work(%DailyWork{} = daily_work, attrs \\ %{}) do
    DailyWork.changeset(daily_work, attrs)
  end
end
