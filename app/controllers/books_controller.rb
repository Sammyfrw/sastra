class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
  end
end
