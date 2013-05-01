class CreateMerchantCategories < ActiveRecord::Migration
  def change
    create_table :merchant_categories do |t|
      t.string :name
      t.string :slug
      t.string :ancestry
      t.integer :position

      t.timestamps
    end
  end
end
