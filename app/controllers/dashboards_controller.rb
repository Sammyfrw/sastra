class DashboardsController < ApplicationController
  def new
    @shout = Shout.new
    @announcement = Announcement.new
  end
end
