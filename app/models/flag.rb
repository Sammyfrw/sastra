class Flag < ActiveRecord::Base
  belongs_to :flaggable, polymorphic: true
end
