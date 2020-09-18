defmodule Excel01Web.Exports.PostView do
  use Excel01Web, :view
  alias Elixlsx.{Workbook, Sheet}
  alias Excel01.Src.DaiLyWork.DailyWorks
  alias Timex

  def render("report.xlsx", %{posts: posts, employees: employees}) do
    IO.inspect posts
    IO.inspect employees
    report_generator(employees)
    |> Elixlsx.write_to_memory("report.xlsx")
    |> elem(1)
    |> elem(1)
  end
  def report_generator(employees) do
    current_day = Timex.now
    days = month_rows(current_day)
    day_num_month = ["", "" | Enum.map(days, fn(s) -> s.day  end)]
    day_name_month = ["STT", "Fullname" | Enum.map(days, fn(s) -> Timex.day_name(Date.day_of_week(s))  end)]
    header = [
      "ID",
      "Name",
      "Title",
      "Content"
    ]
    rows = employees |> Enum.map(&(row(&1, days)))

    IO.inspect "-------------------------------------------"
    IO.inspect rows

    sheet1 = %Sheet{
      name: "Posts",
      rows: [day_num_month] ++ [day_name_month] ++ rows
    }

    workbook = %Workbook{
      sheets: [sheet1]
    }


    sheet2 = %Sheet{
      name: "Posts2",
      rows: [header] ++ rows
    }

    Workbook.append_sheet(workbook, sheet2)
    # |> Elixlsx.write_to("example.xlsx")

    # %Workbook{
    #   sheets:
    #   [
    #     ,

    #   ]
    # }
      # %Workbook{sheets: [%Sheet{name: "Posts2", rows: [@header] ++ rows}]}
    end
  def row(employee, days) do
    IO.inspect days

    test_day =
      for day <- days do
        date_time = Timex.to_unix(day)
        day_work = DailyWorks.get_daily_work_by_id_date(employee.sUserID, date_time)
        if not(is_nil(day_work)) do
          # IO.inspect "--------------- Item ------------------"
          # IO.inspect day_work
          # IO.inspect day_work.min_time
          # for item <- day_work do
          #   IO.inspect "ok"
          #   IO.inspect item
          # end

          #day_inf = Map.to_list(day_work)#Enum.map(%{day_work}, fn x -> x end)
          # IO.inspect is_list(day_work)
          # IO.inspect "--------------- MAP ------------------"
          # IO.inspect Enum.map(day_work, fn x -> x end)
          # if is_nil(day_work.min_time) do
          #   "ok"
          # end
          if is_integer(day_work.min_time) and is_integer(day_work.max_time) do
            "1"
          else
            if is_integer(day_work.min_time) do
              "1/2"
            end
          end
        else
          ""
        end
        #IO.inspect day_work
      end

      IO.inspect "---------------------------------"
      IO.inspect test_day

    employee_inf = [
      employee.sUserID,
      employee.sUserName,
    ]

    num = Enum.map(employee_inf, fn(s) -> s end) ++ Enum.map(test_day, fn(s) -> s end)

    # num = [
    #   Enum.map(test, fn(s) -> s end)
    #   # |
    #   # "1",
    #   # "2",
    #   # "3",
    #   # "ok"
    #   #| Enum.map(test, fn(s) -> s end)
    # ]


    IO.inspect num
    # IO.inspect num
    # IO.inspect [test | num]
    # list_rec =
    #   for item <- post do
    #     Ecto.embedded_dump(item, :json)
    #   end
    # IO.inspect list_rec
    #Enum.map(list_rec, fn(s) -> s  end)
    # [
    #   post.id,
    #   post.name,
    #   post.title,
    #   post.content
    # ]
  end

  defp month_rows(current_date) do
    first =
      current_date
      |> Timex.beginning_of_month()

    last =
      current_date
      |> Timex.end_of_month()

    Timex.Interval.new(from: first, until: last) |> Enum.map(& &1)
  end

end
