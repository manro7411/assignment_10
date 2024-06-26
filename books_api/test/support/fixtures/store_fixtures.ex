defmodule BooksApi.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApi.Store` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{

      })
      |> BooksApi.Store.create_book()

    book
  end
end
