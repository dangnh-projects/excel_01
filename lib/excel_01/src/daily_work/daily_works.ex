defmodule Excel01.Src.DaiLyWork.DailyWorks do
  import Ecto.Query, warn: false
  alias Excel01.RepoWorkDays
  alias Excel01.DailyWorks.DailyWork

  def get_daily_work do
    DailyWork
    |> where([e], (1600387200 - 86400 - 86401) < e.work_date and e.work_date < 1600387201)
    |> order_by([e], [desc: e.work_date])
    |> RepoWorkDays.all
  end

  def get_daily_work_by_id_date(id, date) do
    DailyWork
    |> where([e], e.user_id == ^id and e.work_date == ^date)
    |> where([e], (1600387200 - 86400 - 86401) < e.work_date and e.work_date < 1600387201)
    |> order_by([e], [desc: e.work_date])
    |> RepoWorkDays.one
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
