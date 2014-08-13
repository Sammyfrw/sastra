class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments
    @comment = Comment.new
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

  def edit
    @users = User.all
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book
    else
      render book
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
      :description,
      :image_url,
      author_ids: [],
      shop_ids: [],
      publisher_ids: []
    )
  end
end
