class CreateJoinTableUserBook < ActiveRecord::Migration
  def change
    create_join_table :users, :books, table_name: :book_authors do |t|
      t.belongs_to :author, null: false, index: true
      t.belongs_to :book, null: false, index: true

      t.timestamps
    end
  end
end
