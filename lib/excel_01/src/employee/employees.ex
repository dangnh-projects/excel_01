defmodule Excel01.Src.Employee.Employees do
  import Ecto.Query, warn: false
  alias Excel01.RepoWorkDays
  alias Excel01.Employees.Employee

  def list_all_employees do
    Employee
    |> where([e], e.status_actived == true)
    |> where([e], e.nDepartmentIdn == 1 and e.manager_role == true)
    |> order_by([e], [asc: e.nUserIdn])
    |> RepoWorkDays.all()
  end

  # def list_wd_employees do
  #   WD_Employee
  #   |> where([e], e.sEmail != "" and not(is_nil(e.sEmail)))
  #   |> order_by([e], [asc: e.nUserIdn])
  #   |> Repo.all()
  # end

  # def list_active_mail_employees do
  #   WD_Employee
  #   |> where([e], e.send_mail == true and e.status_actived == true)
  #   |> where([e], e.sEmail != "" and not(is_nil(e.sEmail)))
  #   |> order_by([e], [asc: e.nUserIdn])
  #   |> Repo.all()
  # end

  # def get_employee!(sUserID), do: Repo.get!(WD_Employee, sUserID)

  # def get_employee_by_email(sEmail) do
  #   Repo.one from e in WD_Employee, where: e.sEmail == ^sEmail
  # end

  # def get_manager_by_department_id(nDepartmentIdn) do
  #   Repo.one from e in WD_Employee, where: e.nDepartmentIdn == ^nDepartmentIdn and e.manager_role == true
  # end

  # def get_employee_item(sUserID) do
  #   Repo.all from e in WD_Employee, where: e.sUserID == ^sUserID
  # end

  # def change_employee(%WD_Employee{} = employee, attrs \\ %{}) do
  #   WD_Employee.changeset(employee, attrs)
  # end

  # def update_employee(%WD_Employee{} = employee, attrs) do
  #   employee
  #   |> WD_Employee.changeset(attrs)
  #   |> Repo.update()
  # end
end
