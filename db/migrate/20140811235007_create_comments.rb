class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, index: true
      t.string :commentable_type, null: false
      t.integer :commentable_id, null: false
      t.text :text, null: false, default: ""

      t.timestamps null: false
    end
  end
end
