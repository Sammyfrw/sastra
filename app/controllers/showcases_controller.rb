class ShowcasesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @book = Book.new
    @snippets = @user.snippets
    @partner_relationships = @user.partner_relationships
    @initiator_relationships = @user.initiator_relationships
  end
end
