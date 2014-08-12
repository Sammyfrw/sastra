class CreateFeature < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.belongs_to :user, null: false, index: true
      t.string :feature_type, null: false
      t.integer :feature_id, null: false

      t.timestamps null: false
    end
  end
end
