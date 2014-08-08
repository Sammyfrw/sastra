class PartnerRelationshipsController < ApplicationController
  def new
    @partner_relationship = PartnerRelationship.new
    @users = User.all
  end

  def create
    new_partnership = current_user.partner_relationships.new(partner_params)
    if new_partnership.save
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    partnership = PartnerRelationship.find(params[:id])
    if partnership.partner == current_user || partner_relationship.initiator == current_user
      partnership.destroy
    end
    redirect_to current_user
  end

  private

  def partner_params
    params.require(:partner_relationship).permit(
      :message,
      :partner_id,
    )
  end
end
