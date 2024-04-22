defmodule BooksApi.Store.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :title, :string
    field :authors, {:array, :string}
    field :description, :string
    field :isbn, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(book, attrs \\ %{}) do
    book
    |> cast(attrs, [:title, :authors, :description, :isbn, :price])
    |> validate_required([:title, :authors, :description, :isbn, :price])
    |> validate_length(:title, min: 1)
    |> validate_length(:authors, min: 1)
    |> validate_length(:description, min: 1)
    |> validate_length(:isbn, min: 1)
    |> validate_format(:isbn, ~r/\A\d{10,13}\z/, message: "must be a valid ISBN (10 or 13 digits)")
    |> unique_constraint(:isbn, name: :unique_isbn)
  end
end
