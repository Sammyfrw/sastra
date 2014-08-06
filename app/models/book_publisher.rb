class BookPublisher < ActiveRecord::Base
  belongs_to :publisher, class_name: "User"
  belongs_to :book
end
