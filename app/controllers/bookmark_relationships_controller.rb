class BookmarkRelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.bookmark(@user)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.remove_bookmark(@user)
    redirect_to @user
  end
end
