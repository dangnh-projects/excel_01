defmodule Excel01Web.Exports.PostView do
  use Excel01Web, :view
  alias Elixlsx.{Workbook, Sheet}
  alias Timex

  def render("report.xlsx", %{posts: posts}) do
      report_generator(posts)
      |> Elixlsx.write_to_memory("report.xlsx")
      |> elem(1)
      |> elem(1)
    end
  def report_generator(posts) do
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
    rows = posts |> Enum.map(&(row(&1)))
    %Workbook{
      sheets:
      [
        %Sheet{
          name: "Posts",
          rows: [day_num_month] ++ [day_name_month] ++ rows
        },
        %Sheet{
          name: "Posts2",
          rows: [header] ++ rows
        }
      ]
    }
      # %Workbook{sheets: [%Sheet{name: "Posts2", rows: [@header] ++ rows}]}
    end
  def row(post) do
    test = [
      post.id,
      post.name,
      post.title,
      post.content
    ]

    num = [
      "1",
      "2",
      "3",
      "ok"
      | Enum.map(test, fn(s) -> s end)
    ]


    IO.inspect test
    IO.inspect num
    IO.inspect [test | num]
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
