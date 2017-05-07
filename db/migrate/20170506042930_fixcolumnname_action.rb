class FixcolumnnameAction < ActiveRecord::Migration
  def change
    rename_column :alerts, :saction, :action
  end
end
