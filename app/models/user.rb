class User < ActiveRecord::Base
  has_many :books
  has_many :showcase_books
  has_many :announcements
  has_many :snippets
  has_many :partners
  
end
