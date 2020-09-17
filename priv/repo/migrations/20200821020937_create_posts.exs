defmodule Excel01.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :title, :string
      add :content, :text

      timestamps()
    end

  end
end
