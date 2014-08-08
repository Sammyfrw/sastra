class User < ActiveRecord::Base
  has_many :flags, as: :flaggable, dependent: :destroy

  has_one :profile, dependent: :destroy
  has_many :books
  has_many :announcements, dependent: :destroy
  has_many :snippets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy

  has_many :sent_shouts, foreign_key: :sender_id, class_name: "Shout"
  has_many :received_shouts, foreign_key: :receiver_id, class_name: "Shout"

  has_many :bookmarked_user_relationships,
    foreign_key: :bookmarker_id,
    class_name: "BookmarkRelationship"
  has_many :bookmarked_users, through: :bookmarked_user_relationships,
    dependent: :destroy

  has_many :bookmarker_relationships,
    foreign_key: :bookmarked_user_id,
    class_name: "BookmarkRelationship"

  has_many :bookmarkers, through: :bookmarker_relationships,
    dependent: :destroy

  has_many :initiator_relationships, foreign_key: :partner_id,
    class_name: "PartnerRelationship", dependent: :destroy
  has_many :initiators, through: :initiator_relationships

  has_many :partner_relationships, foreign_key: :initiator_id,
    class_name: "PartnerRelationship", dependent: :destroy
  has_many :partners, through: :partner_relationships

  has_many :book_authors,
    foreign_key: :author_id,
    class_name: "BookAuthor"
  has_many :authored_books, through: :book_authors, source: :book,
    dependent: :destroy

  has_many :book_publishers,
    foreign_key: :publisher_id,
    class_name: "BookPublisher"
  has_many :published_books, through: :book_publishers, source: :book,
    dependent: :destroy

  has_many :book_shops,
    foreign_key: :book_shop_id,
    class_name: "BookShop"
  has_many :stocked_books, through: :book_shops, source: :book,
    dependent: :destroy

  has_many :book_owners,
    foreign_key: :owner_id,
    class_name: "BookOwner"
  has_many :owned_books, through: :book_owners, source: :book,
    dependent: :destroy

  validates :username, uniqueness: true, presence: true,
                        format: { with: /\A[a-zA-Z]+\z/, message: "Please use only letters" },
                        length: { minimum: 3,
                                  maximum: 20,
                                  wrong_length: "Please input a username between 3 to 20 letters." }

  validates :password_digest, presence: true,
                        length: { minimum: 6,
                                  wrong_length: "Please input a password with 6 or more characters." }

  validates :admin, inclusion: { in: [true, false] }
  validates :locked, inclusion: { in: [true, false] }

  def involved_shouts
    shouts.where("sender_id = ? OR receiver_id = ?", id, id)
  end

  def self.query(search_term)
    where("username ILIKE ?", "%#{search_term}%")
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

  def can_edit?(object)
    admin || id == object.user_id
  end

  def can_edit_book?(book)
    admin || book.authors.exists?(self)
  end

  def flagged_by?(user)
    flags.exists?(user: user)
  end
end
