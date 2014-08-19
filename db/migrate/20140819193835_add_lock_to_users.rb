class AddLockToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locked, :boolean, default: false, null: false
  end
end
