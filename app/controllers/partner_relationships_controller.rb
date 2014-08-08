class PartnerRelationshipsController < ApplicationController
  def new
    @partner_relationship = PartnerRelationship.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @partnered_user = current_user.pending_partnered_user_relationships.new(partner_params)
    if @partnered_user.save
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def partner_params
    params.require(:partner_relationship).permit(
      :message,
      :partnered_user_id,
    )
  end
end
