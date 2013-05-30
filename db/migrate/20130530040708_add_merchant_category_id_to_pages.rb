class AddMerchantCategoryIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :merchant_category_id, :integer
  end
end
