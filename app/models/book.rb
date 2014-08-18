class Book < ActiveRecord::Base
  STATUS = %w(In-Progress Draft Final-Draft Editing Finalizing Published)
  mount_uploader :image_url, ImageUploader

  has_many :flags, as: :flaggable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
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
