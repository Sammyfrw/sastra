class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @shout = Shout.new
    @shouts = @user.ordered_shouts
    @announcements = @user.ordered_announcements
    @announcement = Announcement.new
  end

  def create
    @user = sign_up(user_params)
    profile = @user.create_profile(user_id: @user.id)
    new_account = Reader.create
    profile.account = new_account
    profile.save

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

