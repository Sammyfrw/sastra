class Flag < ActiveRecord::Base
  belongs_to :flaggable, polymorphic: true
  belongs_to :user

  validates :user_id, presence: true

  def name
    if flaggable.class == User
      flaggable.username
    else
      flaggable.title
    end
  end
end
