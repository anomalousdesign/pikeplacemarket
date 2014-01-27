class Merchant < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  # acts_as_taggable
  # acts_as_taggable_on :tags
  # attr_accessible :tag_list # for acts as taggable on

  has_many :merchant_categorizations
  has_many :merchant_categories, through: :merchant_categorizations

  after_save :expire_cache

  def editables
    Editable::EditableImage.where("name like ?", "merchant-thumb-#{id}")
  end

  def expire_cache
  	Rails.cache.delete "merchant-#{id}-item"
  end

  def self.locations
  	select("distinct market_location").where("market_location is not null and market_location != ''").order("market_location").map{|m| m.market_location}
  end

  # 2 layer hash
  def self.nested_hash(merchants)
    hash = {}
    merchants.each{|category|
      hash[category.name] = {}
      category.children.map{|child|
        hash[category.name][child.name] = child.merchants.as_json
      }
    }
    hash
  end

  # infinite layer hash
  def self.deep_hash(categories)
    hash = {}
    categories.each{|category|
      hash[category.name] = {}
      hash[category.name][:merchants] = category.merchants.as_json
      hash[category.name][:categories] = deep_hash(category.children) if category.children.present?
    }
    hash
  end

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
