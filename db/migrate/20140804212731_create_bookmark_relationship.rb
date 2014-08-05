class CreateBookmarkRelationship < ActiveRecord::Migration
  def change
    create_table :bookmark_relationships do |t|
      t.belongs_to :bookmarked_user, null: false, index: true
      t.belongs_to :bookmarker, null: false, index: true

      t.timestamps null: false
    end
    add_index :bookmark_relationships, [:bookmarker_id, :bookmarked_user_id], unique: true, name: 'bookmark_relationships_index_unique_constraint'
  end
end
