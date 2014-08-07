class RemoveUserIdFromJoinTables < ActiveRecord::Migration
  def change
    remove_column :book_authors, :user_id, :integer
    remove_column :book_publishers, :user_id, :integer
    remove_column :book_shops, :user_id, :integer
  end
end
