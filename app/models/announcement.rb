class Announcement < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :flags, as: :flaggable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

  after_create :create_feedable

  private

  def create_feedable
    bookmarkers.each do |user|
      Activity.create(
        feedable: self,
        user: user
      )
    end
  end

  def bookmarkers
    user.bookmarkers
  end
end
