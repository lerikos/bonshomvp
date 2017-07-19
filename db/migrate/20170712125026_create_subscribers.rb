class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.timestamps
    end
    add_reference :subscribers, :user, index: true
    add_reference :subscribers, :product, index: true
  end
end
