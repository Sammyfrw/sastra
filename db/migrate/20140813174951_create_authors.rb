class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.timestamps null: false
    end
  end
end
