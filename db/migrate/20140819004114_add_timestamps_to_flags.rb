class AddTimestampsToFlags < ActiveRecord::Migration
  def change
    add_timestamps :flags
  end
end
