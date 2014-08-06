class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors, class_name: "User"

  has_many :book_owners
  has_many :owners, through: :book_owners, class_name: "User"

  has_many :book_publishers
  has_many :publishers, through: :book_publishers, class_name: "User"

  has_many :book_shops
  has_many :bookshops, through: :book_shops, class_name: "User"

  validates :author_id, presence: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :status, presence: true
  validates :format, presence: true
  validates :verified, presence: true
end
