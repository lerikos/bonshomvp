class FixcolumnnameUrl < ActiveRecord::Migration
  def change
    rename_column :alerts, :URL, :source
  end
end
