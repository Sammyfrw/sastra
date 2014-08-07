class RenameBookShopIdToShopIdInBookShop < ActiveRecord::Migration
  def change
    rename_column :book_shops, :book_shop_id, :shop_id
  end
end
