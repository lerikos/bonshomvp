class CreateAlertProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :alert_products do |t|
      t.timestamps
    end

    add_reference :alert_products, :alert, index: true
    add_reference :alert_products, :product, index: true
  end
end
