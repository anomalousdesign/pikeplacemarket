class RemoveNullContraints < ActiveRecord::Migration
  def up

  	change_column :events, :title, :string, 							:null => true
  	change_column :events, "start", :datetime,            :null => true
    change_column :events, "end", :datetime,              :null => true
    change_column :events, "details", :text,              :null => true
    change_column :events, "featured", :boolean,          :null => true

    change_column :merchants, "title", :string,           :limit => 100, :null => true
    change_column :merchants, "sub_title", :string,       :limit => 100, :null => true
    change_column :merchants, "phone", :string,           :limit => 20,  :null => true
    change_column :merchants, "address", :string,         :limit => 250, :null => true
    change_column :merchants, "city", :string,            :limit => 100, :null => true
    change_column :merchants, "state", :string,           :limit => 100, :null => true
    change_column :merchants, "zip", :string,             :limit => 20,  :null => true
    change_column :merchants, "email", :string,           :limit => 200, :null => true
    change_column :merchants, "link", :string,            :limit => 250, :null => true
    change_column :merchants, "hours", :string,           :limit => 100, :null => true
    change_column :merchants, "market_location", :string, :limit => 200, :null => true
    change_column :merchants, "about", :text,                          :null => true
    change_column :merchants, "tags", :text,                           :null => true
    change_column :merchants, "map_x", :integer,                          :null => true
    change_column :merchants, "map_y", :integer,                          :null => true

    change_column :pages, "publish", :boolean,                    :default => false, :null => true
    change_column :pages, "position", :integer,                   :default => 0,     :null => true
    change_column :pages, "template", :string,    :limit => 100, :default => "",    :null => true
    change_column :pages, "title", :string,                      :default => "",    :null => true
    change_column :pages, "keywords", :text,                                      :null => true
    change_column :pages, "description", :text,                                   :null => true


  end

  def down
  end
end
