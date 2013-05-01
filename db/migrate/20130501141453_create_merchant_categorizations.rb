class CreateMerchantCategorizations < ActiveRecord::Migration
  def change
    create_table :merchant_categorizations do |t|
      t.integer :merchant_id
      t.integer :merchant_category_id

      t.timestamps
    end
    add_index :merchant_categorizations, [:merchant_id, :merchant_category_id], name: "index_merchant_categorizations_on_ids"
  end
end
