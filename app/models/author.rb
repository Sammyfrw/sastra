class Author < ActiveRecord::Base
  has_one :profile, as: :account, dependent: :destroy
end
