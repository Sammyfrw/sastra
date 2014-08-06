class CreateBook < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :author, index: true, null: false
      t.belongs_to :owner, index: true
      t.string :title, null: false
      t.string :genre, null: false
      t.string :status, null: false
      t.string :format, null: false
      t.string :edition
      t.belongs_to :publisher, index: true
      t.date :published
      t.integer :ISBN_10
      t.integer :ISBN_13
      t.belongs_to :bookshop, index: true
      t.boolean :verified, default: false, null: false

      t.timestamp null:false
    end
  end
end
