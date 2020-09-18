defmodule Excel01.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "tb_employees" do
    field :sUserID, :string, primary_key: true
    field :nDepartmentIdn, :integer
    field :nEndDate, :integer
    field :nStartDate, :integer
    field :sEmail, :string
    field :sTelNumber, :string
    field :sUserName, :string
    field :nUserIdn, :integer
    field :send_mail, :boolean
    field :status_actived, :boolean
    field :manager_role, :boolean

    #timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:nUserIdn, :sUserName, :nDepartmentIdn, :sTelNumber, :sEmail, :sUserID, :nStartDate, :nEndDate, :send_mail, :status_actived, :manager_role])
    |> validate_required([:nUserIdn, :sUserName, :nDepartmentIdn, :sUserID])
  end
end
