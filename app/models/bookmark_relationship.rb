class BookmarkRelationship < ActiveRecord::Base
  belongs_to :bookmarker, class_name: "User"
  belongs_to :bookmarked_user, class_name: "User"

  validate :user_cannot_bookmark_themselves

  def user_cannot_bookmark_themselves
    if bookmarker_id == bookmarked_user_id
      errors.add(:base, "Users cannot bookmark themselves")
    end
  end
end
