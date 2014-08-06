class CreateJoinTablePublisherBook < ActiveRecord::Migration
  def change
    create_join_table :users, :books, table_name: :book_publishers do |t|
      t.belongs_to :publisher, null: false, index: true
      t.belongs_to :book, null: false, index: true

      t.timestamps
    end
  end
end
