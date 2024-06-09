defmodule App.ContextCategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.ContextCategories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        category_id: 42,
        name: "some name"
      })
      |> App.ContextCategories.create_category()

    category
  end
end
