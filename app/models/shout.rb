class Shout < ActiveRecord::Base
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  validates :body, presence: true

  def involves?(user)
    sender == user || receiver == user
  end
end
