class Feature < ActiveRecord::Base
  belongs_to :featureable, polymorphic: true
  belongs_to :user

end
