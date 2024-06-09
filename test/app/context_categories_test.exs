defmodule App.ContextCategoriesTest do
  use App.DataCase

  alias App.ContextCategories

  describe "categories" do
    alias App.ContextCategories.Category

    import App.ContextCategoriesFixtures

    @invalid_attrs %{category_id: nil, name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert ContextCategories.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert ContextCategories.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{category_id: 42, name: "some name"}

      assert {:ok, %Category{} = category} = ContextCategories.create_category(valid_attrs)
      assert category.category_id == 42
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContextCategories.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{category_id: 43, name: "some updated name"}

      assert {:ok, %Category{} = category} = ContextCategories.update_category(category, update_attrs)
      assert category.category_id == 43
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = ContextCategories.update_category(category, @invalid_attrs)
      assert category == ContextCategories.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = ContextCategories.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> ContextCategories.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = ContextCategories.change_category(category)
    end
  end
end
