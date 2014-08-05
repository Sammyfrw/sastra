class BookmarkedUsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @users = @user.bookmarked_users
  end
end
