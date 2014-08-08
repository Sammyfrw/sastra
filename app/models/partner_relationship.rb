class PartnerRelationship < ActiveRecord::Base
  belongs_to :partnered_user, class_name: "User"
  belongs_to :partner, class_name: "User"
end
