class AddTimestampsToTables < ActiveRecord::Migration
  def change
    add_timestamps :activities
    add_timestamps :books
  end
end
