class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.belongs_to "sender", null: false
      t.belongs_to "receiver", null: false
      t.string "body", null: false

      t.timestamps null:false
    end
  end
end
