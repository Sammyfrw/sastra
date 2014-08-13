class Bookshop < ActiveRecord::Base
  has_one :profile, as: :account, dependent: :destroy
end
