class ChangeColumnProperties < ActiveRecord::Migration
  def up
    change_column :announcements, :body, :text
    change_column :partner_relationships, :message, :text
    change_column :shouts, :body, :text
  end

  def down
    change_column :announcements, :body, :string
    change_column :partner_relationships, :message, :string
    change_column :shouts, :body, :string
  end
end
