class LockUsersController < ApplicationController
  def update
    user = User.find(params[:user][:id])
    if current_user.admin?
      toggle_lock(user)
      user.save
      redirect_to settings_path
    end
  end

  private

  def toggle_lock(user)
    user.toggle(:locked)
  end
end
