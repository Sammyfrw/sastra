class Announcement < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
