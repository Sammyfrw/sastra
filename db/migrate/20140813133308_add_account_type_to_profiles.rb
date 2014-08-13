class AddAccountTypeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :account_type, :string, null: false, default: "Reader"
    add_column :profiles, :account_id, :integer, null: false, default: ""
  end
end
