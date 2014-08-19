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
      render :new
    end
  end

  def edit
    @users = User.all
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if current_user.admin?
      book.update(book_params.merge(verified: params[:book][:verified]))
      redirect_to book
    elsif book.update(book_params)
      redirect_to book
    else
      render book
    end
  end

  def destroy
    book = Book.find(params[:id])
    if current_user.can_edit_book?(book)
      book.destroy
    end
    redirect_to root_path
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
      :description,
      :image_url,
      author_ids: [],
      shop_ids: [],
      publisher_ids: []
    )
  end
end
