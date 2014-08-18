class SettingsController < ApplicationController
  def show
    @users = User.where(admin: false).order(username: :asc)
    @admins = User.where(admin: true).order(username: :asc)
    @flags = Flag.all
  end

  def update
    user = User.find(params[:user][:id])
    if current_user.admin
      toggle_admin(user)
      user.save
      redirect_to settings_path
    end
  end

  private

  def toggle_admin(user)
    user.admin = !(user.admin)
  end


end
