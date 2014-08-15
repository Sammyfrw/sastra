class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user, null: false, index: true
      t.integer :feedable_id, null: false, index: true
      t.string :feedable_type, null: false, index: true
    end
  end
end
