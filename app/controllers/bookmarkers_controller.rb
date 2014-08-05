class BookmarkersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @users = @user.bookmarkers
  end
end
