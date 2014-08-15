class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :feedable, polymorphic: true, dependent: :destroy
end
