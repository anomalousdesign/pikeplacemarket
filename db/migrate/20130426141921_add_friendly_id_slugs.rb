class AddFriendlyIdSlugs < ActiveRecord::Migration
  def up
    
    add_column :events, :slug, :string
    add_index :events, :slug
    
    add_column :merchants, :slug, :string
    add_index :merchants, :slug
    
    drop_table :pages
    
    create_table "pages", :force => true do |t|
      t.boolean  "publish",                    :default => false, :null => false
      t.integer  "position",                   :default => 0,     :null => false
      t.string   "template",    :limit => 100, :default => "",    :null => false
      t.string   "title",                      :default => "",    :null => false
      t.text     "keywords",                                      :null => false
      t.text     "description",                                   :null => false
      t.string   "link"
      t.datetime "live_start"
      t.datetime "live_end"
      t.string   "slug"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_index :pages, :slug
  end

  def down
  end
end
