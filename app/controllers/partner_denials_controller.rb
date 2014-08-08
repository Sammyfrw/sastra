class PartnerDenialsController < ApplicationController
  def create
    partner_relationship = PartnerRelationship.find(params[:partner_relationship_id])
    if current_user == partner_relationship.partner
      partner_relationship.destroy
    end
    redirect_to current_user
  end
end
