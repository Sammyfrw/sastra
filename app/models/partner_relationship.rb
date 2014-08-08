class PartnerRelationship < ActiveRecord::Base
  belongs_to :initiator, class_name: "User"
  belongs_to :partner, class_name: "User"

  def offered_from?(user)
    initiator == user && accepted == false
  end

  def offered_to?(user)
    partner == user && accepted == false
  end

  def accepted?
    accepted == true
  end
end
