class SettingsController < ApplicationController
  def show
    users = User.order(username: :asc)
    @non_admins = users.where(admin: false)
    @admins = users.where(admin: true)
    @unlocked_users = users.where(locked: false)
    @locked_users = users.where(locked: true)
    @flags = Flag.all
  end
end
