class ShowcasesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @book = Book.new
  end
end
