class ShoutsController < ApplicationController
  def create
    @shout = current_user.sent_shouts.create(shout_params)
    redirect_to @shout.receiver
  end

  def destroy
    shout = current_user.involved_shouts.find(params[:id])
    shout.destroy
    redirect_to shout.receiver
  end

  private

  def shout_params
    params.require(:shout).permit(
      :body
      ).merge(receiver_id: params[:user_id])
  end
end
