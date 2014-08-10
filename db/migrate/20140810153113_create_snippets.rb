class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.belongs_to :user, null: false, index: true
      t.string :book, null: false, default: ""
      t.integer :page, null: false, default: ""
      t.integer :chapter, null: false, default: ""
      t.text :snippet_text, null: false, default: ""
      t.string :snippet_source, null: false, default: ""

      t.timestamps
    end
  end
end
