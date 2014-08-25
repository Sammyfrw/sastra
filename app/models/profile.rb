class Profile < ActiveRecord::Base
  ACCOUNT_TYPES = ["Reader", "Author", "Publisher", "Bookshop"]

  belongs_to :user
  belongs_to :account, polymorphic: true
  mount_uploader :avatar, ImageUploader
  mount_uploader :banner, ImageUploader
end
