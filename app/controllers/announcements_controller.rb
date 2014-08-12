class AnnouncementsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @announcements = @user.announcements.page(params[:page]).per(10)
  end

  def show
    @announcement = Announcement.find(params[:id])
    @user = @announcement.user
    @comments = @announcement.comments
    @comment = Comment.new
  end

  def new
    @announcement = current_user.announcements.new
  end

  def create
    announcement = current_user.announcements.new(announcement_params)
    if announcement.save
      redirect_to announcement
    else
      render :new
    end
  end

  def edit
    @announcement = current_user.announcements.find(params[:id])
  end

  def update
    announcement = current_user.announcements.find(params[:id])
    if announcement.update(announcement_params)
      redirect_to announcement
    else
      render :edit
    end
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
