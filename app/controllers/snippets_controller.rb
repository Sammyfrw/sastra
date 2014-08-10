class SnippetsController < ApplicationController
	def show
    @user = User.find(params[:user_id])
	end

  def new
    @snippet = Snippet.new
  end

  def create
    snippet = current_user.snippets.new(snippet_params)
    if snippet.save
      redirect_to [current_user, :showcase]
    else
      render new
    end
  end

  def edit
    @snippet = current_user.snippets.find(params[:id])
  end

  def update
    snippet = current_user.snippets.find(params[:id])
    snippet.update(snippet_params)
    redirect_to [current_user, :showcase]
  end

  def destroy
    snippet = current_user.snippets.find(params[:id])
    snippet.destroy
    redirect_to [current_user, :showcase]
  end

  private

  def snippet_params
    params.require(:snippet).permit(
      :book,
      :chapter,
      :page,
      :snippet_text,
      :snippet_source
    )
  end
end
