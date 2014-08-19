class SearchesController < ApplicationController
  def show
    @users = User.query(params[:name])
  end
end
