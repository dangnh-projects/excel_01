defmodule Excel01Web.EmployeeController do
  use Excel01Web, :controller
  alias Excel01.Src.Employee.Employees

  def index(conn, _params) do
    employees = Employees.list_all_employees()
    render(conn, "index.html", employees: employees)
  end

  # def edit(conn, %{"id" => id}) do
  #   employee = Employees.get_employee!(id)
  #   changeset = Employees.change_employee(employee)
  #   render(conn, "edit.html", employee: employee, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "wd__employee" => employee_params}) do
  #   employee = Employees.get_employee!(id)

  #   case Employees.update_employee(employee, employee_params) do
  #     {:ok, _} ->
  #       conn
  #       |> put_flash(:info, "Employee updated successfully.")
  #       |> redirect(to: Routes.employee_path(conn, :index))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", employee: employee, changeset: changeset)
  #   end
  # end
end
