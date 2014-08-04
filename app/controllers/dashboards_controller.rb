class DashboardsController < ApplicationController

  def new
    @user = current_user
    @shouts = current_user.received_shouts.order(created_at: :desc)
    @shout = Shout.new
  end
end
