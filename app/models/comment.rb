class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :flags, as: :flaggable, dependent: :destroy

  validates :text, presence: true
  validates :user_id, presence: true
end
