class PartnerApprovalsController < ApplicationController
  def create
    partner_relationship = PartnerRelationship.find(params[:partner_relationship_id])
    if current_user == partner_relationship.partner
      approve(partner_relationship)
      partner_relationship.save
    end
    redirect_to current_user
  end

  private

  def approve(partnership)
    partnership.toggle(:accepted)
  end
end
