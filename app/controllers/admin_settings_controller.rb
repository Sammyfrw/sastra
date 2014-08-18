class AdminSettingsController < ApplicationController
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
    user.toggle(:admin)
  end
end
