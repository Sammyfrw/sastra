class RenamePartneredUserColumn < ActiveRecord::Migration
  def change
    rename_column :partner_relationships, :partnered_user_id, :initiator_id
  end
end
