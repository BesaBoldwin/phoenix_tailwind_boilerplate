defmodule App.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :category_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
