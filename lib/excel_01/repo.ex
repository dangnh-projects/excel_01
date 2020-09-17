defmodule Excel01.Repo do
  use Ecto.Repo,
    otp_app: :excel_01,
    adapter: Ecto.Adapters.Tds
end
