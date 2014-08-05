class User < ActiveRecord::Base
  has_many :books
  has_many :showcase_books
  has_many :announcements
  has_many :snippets
  has_many :partners

  has_many :sent_shouts, foreign_key: :sender_id, class_name: "Shout"
  has_many :received_shouts, foreign_key: :receiver_id, class_name: "Shout"

  has_many :bookmarked_user_relationships,
    foreign_key: :bookmarker_id,
    class_name: "BookmarkRelationship"

  has_many :bookmarked_users, through: :bookmarked_user_relationships

  has_many :bookmarker_relationships,
    foreign_key: :bookmarked_user_id,
    class_name: "BookmarkRelationship"

  has_many :bookmarkers, through: :bookmarker_relationships

  def involved_shouts
    Shout.where("sender_id = ? OR receiver_id = ?", id, id)
  end

  def bookmark(other_user)
    bookmarked_users << other_user
  end

  def remove_bookmark(other_user)
    bookmarked_users.destroy(other_user)
  end

  def bookmarked?(other_user)
    bookmarked_users.include?(other_user)
  end

  def ordered_shouts
    received_shouts.order(created_at: :desc)
  end
end
