defmodule App.ContextCategories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :category_id, :integer
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :category_id])
    |> validate_required([:name])
  end
end
