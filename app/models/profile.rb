class Profile < ActiveRecord::Base
  ACCOUNT_TYPES = ["Reader", "Author", "Publisher", "Bookshop"]

  belongs_to :user
  belongs_to :account, polymorphic: true
end
