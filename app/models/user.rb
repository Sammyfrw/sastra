class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :books
  has_many :announcements
  has_many :snippets

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

  has_many :partnered_user_relationships,
    foreign_key: :partner_id,
    class_name: "PartnerRelationship", dependent: :destroy
  has_many :partnered_users, through: :partnered_user_relationships

  has_many :pending_partnered_user_relationships, -> { where accepted: false },
    foreign_key: :partner_id,
    class_name: "PartnerRelationship"
  has_many :pending_partnered_users, through: :pending_partnered_user_relationships, source: :partnered_user

  has_many :accepted_partnered_user_relationships, -> { where accepted: true },
    foreign_key: :partner_id,
    class_name: "PartnerRelationship"
  has_many :accepted_partnered_users, through: :accepted_partnered_user_relationships, source: :partnered_user

  has_many :partner_relationships,
    foreign_key: :partnered_user_id,
    class_name: "PartnerRelationship", dependent: :destroy
  has_many :partners, through: :partner_relationships

  has_many :pending_partnerships, -> { where accepted: false },
    foreign_key: :partnered_user_id,
    class_name: "PartnerRelationship"
  has_many :pending_partners, through: :partner_relationships, source: :partner

  has_many :accepted_partnerships, -> { where accepted: true },
    foreign_key: :partnered_user_id,
    class_name: "PartnerRelationship"
  has_many :accepted_partners, through: :accepted_partnerships, source: :partner

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

  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: true

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

  def partnered?(other_user)
    partnered_users.include?(other_user) || partners.include?(other_user)
  end

  def has_profile?
    profile
  end
end
