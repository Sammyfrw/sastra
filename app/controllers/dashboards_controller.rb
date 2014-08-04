class DashboardsController < ApplicationController
  def new
    @user = current_user
    @shouts = Shout.new
  end
end
