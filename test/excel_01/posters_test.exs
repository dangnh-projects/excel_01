defmodule Excel01.PostersTest do
  use Excel01.DataCase

  alias Excel01.Posters

  describe "posts" do
    alias Excel01.Posters.Post

    @valid_attrs %{content: "some content", name: "some name", title: "some title"}
    @update_attrs %{content: "some updated content", name: "some updated name", title: "some updated title"}
    @invalid_attrs %{content: nil, name: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posters.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posters.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posters.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Posters.create_post(@valid_attrs)
      assert post.content == "some content"
      assert post.name == "some name"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posters.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Posters.update_post(post, @update_attrs)
      assert post.content == "some updated content"
      assert post.name == "some updated name"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posters.update_post(post, @invalid_attrs)
      assert post == Posters.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posters.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posters.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posters.change_post(post)
    end
  end
end
