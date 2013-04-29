class Merchant < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  acts_as_taggable_on :tags
  attr_accessible :tag_list # for acts as taggable on
  attr_protected # make all fields accessible

  def self.migrate_old_tags
	  self.all.each do |merchant|
	  	tags = merchant.attributes["tags"]
	    puts tags
	    tags.split(",").each do |id|
	    	id = id.to_i
	      @tag = OldTag.find(id) rescue next
	      merchant.tag_list ||= []
	      merchant.tag_list << @tag.name
	      merchant.tag_list << @tag.value
	    end
	    puts "tag_list = #{merchant.tag_list}"
	    merchant.save
	  end
  end
end
