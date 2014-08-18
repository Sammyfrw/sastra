class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.belongs_to :user, null: false, index: true
      t.string :flaggable_type, null: false, default: "", index: true
      t.integer :flaggable_id, null: false, default: "", index: true
      t.integer :count, null: false, default: ""
    end
  end
end
