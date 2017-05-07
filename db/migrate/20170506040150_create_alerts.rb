class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :title
      t.text :issue
      t.text :saction
      t.string :URL
      t.string :status
    end
  end
end
