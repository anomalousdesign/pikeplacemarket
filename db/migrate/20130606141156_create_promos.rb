class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
    	t.text :caption
    	t.integer :position
    	t.string :link
      t.attachment :image
      t.timestamps
    end
  end
end
