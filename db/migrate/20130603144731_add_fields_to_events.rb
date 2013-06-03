class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :business, :string
    add_column :events, :address, :string
    add_column :events, :url, :string
    add_column :events, :price, :float
    add_column :events, :contact, :string
  end
end
