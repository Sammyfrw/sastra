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

  has_many :owned_books, foreign_key: :owner_id, class_name: "Book"
  has_many  :authored_books, foreign_key: :author_id, class_name: "Book"
  has_many :published_books, foreign_key: :publisher_id, class_name: "Book"
  has_many :sold_books, foreign_key: :bookshop_id, class_name: "Book"

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
    received_shouts.order(created_at: :desc).limit(10)
  end

  def ordered_announcements
    announcements.order(created_at: :desc).limit(10)
  end
end
