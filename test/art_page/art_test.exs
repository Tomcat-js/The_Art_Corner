defmodule ArtPage.ArtTest do
  use ArtPage.DataCase

  alias ArtPage.Art

  describe "pictures" do
    alias ArtPage.Art.Picture

    @valid_attrs %{img_url: "some img_url", title: "some title"}
    @update_attrs %{img_url: "some updated img_url", title: "some updated title"}
    @invalid_attrs %{img_url: nil, title: nil}

    def picture_fixture(attrs \\ %{}) do
      {:ok, picture} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Art.create_picture()

      picture
    end

    test "list_pictures/0 returns all pictures" do
      picture = picture_fixture()
      assert Art.list_pictures() == [picture]
    end

    test "get_picture!/1 returns the picture with given id" do
      picture = picture_fixture()
      assert Art.get_picture!(picture.id) == picture
    end

    test "create_picture/1 with valid data creates a picture" do
      assert {:ok, %Picture{} = picture} = Art.create_picture(@valid_attrs)
      assert picture.img_url == "some img_url"
      assert picture.title == "some title"
    end

    test "create_picture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Art.create_picture(@invalid_attrs)
    end

    test "update_picture/2 with valid data updates the picture" do
      picture = picture_fixture()
      assert {:ok, %Picture{} = picture} = Art.update_picture(picture, @update_attrs)
      assert picture.img_url == "some updated img_url"
      assert picture.title == "some updated title"
    end

    test "update_picture/2 with invalid data returns error changeset" do
      picture = picture_fixture()
      assert {:error, %Ecto.Changeset{}} = Art.update_picture(picture, @invalid_attrs)
      assert picture == Art.get_picture!(picture.id)
    end

    test "delete_picture/1 deletes the picture" do
      picture = picture_fixture()
      assert {:ok, %Picture{}} = Art.delete_picture(picture)
      assert_raise Ecto.NoResultsError, fn -> Art.get_picture!(picture.id) end
    end

    test "change_picture/1 returns a picture changeset" do
      picture = picture_fixture()
      assert %Ecto.Changeset{} = Art.change_picture(picture)
    end
  end
end
