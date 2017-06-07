class AddReferenceToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :user, index: true
    add_reference :products, :alert, index: true
  end
end
