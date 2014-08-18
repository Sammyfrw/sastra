class SettingsController < ApplicationController
  def show
    @users = User.where(admin: false).order(username: :asc)
    @admins = User.where(admin: true).order(username: :asc)
    @flags = Flag.all
  end
end
