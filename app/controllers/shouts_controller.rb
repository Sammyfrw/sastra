class ShoutsController < ApplicationController
  def create
    @shout = current_user.sent_shouts.create(shout_params)
    redirect_to @shout.receiver
  end

  def destroy
    shout = Shout.find(params[:id])
    if shout.involves?(current_user)
      shout.destroy
    end
    redirect_to shout.receiver
  end

  private

  def shout_params
    params.require(:shout).permit(
      :body
      ).merge(receiver_id: params[:user_id])
  end
end
