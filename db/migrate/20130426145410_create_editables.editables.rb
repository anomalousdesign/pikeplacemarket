# This migration comes from editables (originally 20130101211417)
class CreateEditables < ActiveRecord::Migration
  def change
    create_table :editables do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
    
    add_index :editables, [:name]
  end
end
