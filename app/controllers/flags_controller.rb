class FlagsController < ApplicationController
  def create
    flaggable = find_flaggable
    flag = flaggable.flags.create(user_id: current_user.id)
    flag.count.next
    redirect_to flaggable
  end

  private

  def find_flaggable
    Book.find_by(id: params[:book_id]) ||
      Announcement.find_by(id: params[:announcement_id]) ||
      User.find_by(id: params[:user_id]) ||
      Comment.find_by(id: params[:comment_id]) ||
      Shout.find_by(id: params[:shout_id])
  end

  def flag_params
    params.require(:flag).permit(:count).merge(user_id: current_user.id)
  end
end
