defmodule Excel01.DailyWorks.DailyWork do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tb_daily_works" do
    field :user_name, :string
    field :user_id, :integer
    field :mail, :string
    field :department_id, :integer
    field :work_date, :integer
    field :min_time, :integer
    field :max_time, :integer
    field :reader_in, :integer
    field :reader_out, :integer

    timestamps()
  end

  @doc false
  def changeset(daily_work, attrs) do
    daily_work
    |> cast(attrs, [:user_id, :user_name, :mail, :department_id, :work_date, :min_time, :max_time, :reader_in, :reader_out])
    |> validate_required([:user_id, :user_name])
  end
end
