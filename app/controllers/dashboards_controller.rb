class DashboardsController < ApplicationController
  def new
    @shout = Shout.new
    @announcement = Announcement.new
    @activities = current_user.activities
  end
end
