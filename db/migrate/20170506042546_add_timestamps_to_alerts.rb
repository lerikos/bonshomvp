class AddTimestampsToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :created_at, :datetime
    add_column :alerts, :updated_at, :datetime
  end
end
