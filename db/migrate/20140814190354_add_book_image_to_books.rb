class AddBookImageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :image_url, :string, null: false, default: ""
    add_column :books, :description, :text, null: false, default: ""
  end
end
