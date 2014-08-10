class Snippet < ActiveRecord::Base
  belongs_to :user

  validates :snippet_source, presence: true
  validates :snippet_text, presence: true
  validates :book, presence: true
  validates :chapter, presence: true
  validates :page, presence: true
end
