class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @users = User.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book
    else
      render new
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :owner,
      :genre,
      :status,
      :format,
      :edition,
      :published,
      :ISBN_10,
      :ISBN_13,
      :verified,
      author_ids: [],
      shop_ids: [],
      publisher_ids: []
    )
  end
end
