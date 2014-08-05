class CreateAnnouncement < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.belongs_to :user, null: false, index: true
      t.string :body, null: false
      t.string :title, null: false
    end
  end
end
