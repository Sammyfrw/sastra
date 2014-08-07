class Book < ActiveRecord::Base
  STATUS = ["In-Progress", "Draft", "Last Draft",
   "Editing", "Finalizing", "Published"]

  has_many :book_authors
  has_many :authors, through: :book_authors, class_name: "User"

  has_many :book_owners
  has_many :owners, through: :book_owners, class_name: "User"

  has_many :book_publishers
  has_many :publishers, through: :book_publishers, class_name: "User"

  has_many :book_shops
  has_many :shops, through: :book_shops, class_name: "User"

  validates :title, presence: true
  validates :genre, presence: true
  validates :status, presence: true
  validates :format, presence: true
  validates :verified, inclusion: { in: [true, false] }
end
