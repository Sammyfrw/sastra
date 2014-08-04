class User < ActiveRecord::Base
  has_many :books
  has_many :showcase_books
  has_many :announcements
  has_many :snippets
  has_many :partners

  has_many :sent_shouts, foreign_key: "sender_id", class_name: "Shout"
  has_many :received_shouts, foreign_key: "receiver_id", class_name: "Shout"

  def involved_shouts
    Shout.where("sender_id = ? OR receiver_id = ?", id, id)
  end
end
