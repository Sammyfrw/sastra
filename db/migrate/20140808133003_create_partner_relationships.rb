class CreatePartnerRelationships < ActiveRecord::Migration
  def change
    create_table :partner_relationships do |t|
      t.belongs_to :partnered_user, null: false
      t.belongs_to :partner, null: false
      t.string :message, null: false, default: "Hello! Would you like to be my partner?"
      t.boolean :accepted, null: false, default: false

      t.timestamps null:false
    end
    add_index :partner_relationships, [:partner_id, :partnered_user_id], unique: true, name: 'partner_relationships_index_unique_constraint'
  end
end
