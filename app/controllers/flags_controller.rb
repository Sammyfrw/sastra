class FlagsController < ApplicationController
  def create
    flaggable = find_flaggable
    flag = flaggable.flags.create(user_id: current_user.id)
    redirect_to flaggable
  end

  def destroy
    flaggable = find_flaggable
    flag = flaggable.flags.find(params[:id])
    if current_user == flag.user
      flag.destroy
    end
    redirect_to flaggable
  end

  private

  def find_flaggable
    find_books || find_announcement || find_user || find_comment
  end

  def find_books
    Book.find_by(id: params[:book_id])
  end

  def find_announcement
    Announcement.find_by(id: params[:announcement_id])
  end

  def find_user
    User.find_by(id: params[:user_id])
  end

  def find_comment
    Comment.find_by(id: params[:comment_id])
  end
end
