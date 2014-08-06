class CreateJoinTableShopBook < ActiveRecord::Migration
  def change
    create_join_table :users, :books, table_name: :book_shops do |t|
      t.belongs_to :book_shop, null: false, index: true
      t.belongs_to :book, null: false, index: true

      t.timestamps
    end
  end
end
