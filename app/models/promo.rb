class Promo < ActiveRecord::Base
  # attr_accessible :title, :body
  has_attached_file :image, :styles => { :large => "710x445#", :thumb => "200x200#" }
end
