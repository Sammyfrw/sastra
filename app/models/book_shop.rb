class BookShop < ActiveRecord::Base
  belongs_to :shop, class_name: "User"
  belongs_to :book
end
