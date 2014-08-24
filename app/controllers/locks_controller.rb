class LocksController < ApplicationController
  skip_before_action :require_login, only: [:show]
  skip_before_action :check_locked, only: [:show]

  def show
  end
end
