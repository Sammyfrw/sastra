class SettingsController < ApplicationController
  def show
    @users = User.where(admin: false).order(username: :asc)
  end

  def update
    user = User.find(params[:user][:id])
    if current_user.admin
      toggle_admin(user)
      user.save
      redirect_to root_path
    end
  end

  private

  def toggle_admin(user)
    puts "AWRARARWAF"
    user.admin = !(user.admin)
  end


end
