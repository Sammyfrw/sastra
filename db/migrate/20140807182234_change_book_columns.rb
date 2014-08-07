class ChangeBookColumns < ActiveRecord::Migration
  def change
    remove_column :books, :author_id, :integer
    remove_column :books, :bookshop_id, :integer
    remove_column :books, :publisher_id, :integer
    remove_column :books, :owner_id, :integer
  end
end
