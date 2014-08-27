class CommentsController < ApplicationController
  def create
    commentable = find_commentable
    comment = commentable.comments.create(comment_params)
    redirect_to commentable
  end

  def edit
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    if current_user.can_edit?(@comment)
    else
      redirect_to root_path
    end
  end

  def update
    commentable = find_commentable
    comment = commentable.comments.find(params[:id])
    if current_user.can_edit?(comment)
      comment.update(comment_params)
    end
    redirect_to commentable
  end

  def destroy
    @commentable = find_commentable
    comment = @commentable.comments.find(params[:id])
    if current_user == comment.user
      comment.destroy
    end
    redirect_to @commentable
  end

  private

  def find_commentable
    Book.find_by(id: params[:book_id]) ||
      Announcement.find_by(id: params[:announcement_id])
  end

  def comment_params
    params.require(:comment).permit(
      :text
    ).merge(user_id: current_user.id)
  end
end
