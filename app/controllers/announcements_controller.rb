class AnnouncementsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @announcements = @user.announcements.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:user_id])
    @announcement = @user.announcements.find(params[:id])
  end

  def new
    @announcement = current_user.announcements.new
  end

  def create
    announcement = current_user.announcements.create(announcement_params)
    redirect_to [current_user, announcement]
  end

  def edit
    @announcement = current_user.announcements.find(params[:id])
  end

  def update
    announcement = current_user.announcements.find(params[:id])
    announcement.update(announcement_params)
    redirect_to [current_user, announcement]
  end

  def destroy
    announcement = current_user.announcements.find(params[:id])
    announcement.destroy
    redirect_to current_user
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :body)
  end
end
