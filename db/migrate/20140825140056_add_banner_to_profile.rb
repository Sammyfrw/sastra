class AddBannerToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :banner, :string, null: false, default: ""
  end
end
