class CreateProfile < ActiveRecord::Migration

  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false, index: true
      t.string :name, null: false, default: ""
      t.string :pen_name, null: false, default: ""
      t.integer :age, null: false, null: false, default: ""
      t.string :gender, null: false, default: ""
      t.date :birthday, null: false, default: "1/1/1910"
      t.string :country, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.integer :zipcode, null: false, default: ""
      t.string :website, null: false, default: ""
      t.string :avatar, null: false, default: ""

      t.timestamps null: false
    end
  end
end
