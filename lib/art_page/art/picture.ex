defmodule ArtPage.Art.Picture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pictures" do
    field :img_url, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(picture, attrs) do
    picture
    |> cast(attrs, [:title, :img_url])
    |> validate_required([:title, :img_url])
  end
end
