class CreateProductTags < ActiveRecord::Migration[5.0]
  def change
    create_table :product_tags do |t|
      t.timestamps
    end

    add_reference :product_tags, :tag, index: true
    add_reference :product_tags, :product, index: true
  end
end
