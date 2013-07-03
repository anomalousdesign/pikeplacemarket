class Page < ActiveRecord::Base

  belongs_to :merchant_category
  scope :live, lambda{ where("publish = ? or (live_start < ? and live_end > ?)", true, Time.zone.now, Time.zone.now) }

  has_ancestry
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def template_enum
    path = Rails.root.join('app', 'views', 'pages', "*")
    files = Dir.glob(path)
    templates = {}
    files.each do |t|
      key = File.basename(t).split(".").first
      templates[key.titleize] = key
    end
    templates
  end

  def label
    title
  end

  def heading_image_enum
    path = Rails.root.join('app', 'assets', 'images', 'tags-heading', "*")
    files = Dir.glob(path)
    templates = {}
    files.each do |t|
      key = File.basename(t)
      templates[key.split(".").first.titleize] = key
    end
    templates
  end

  def heading_image_path
    if heading_image.present?
      f = heading_image
    else
      f = "clock.png"
    end
    "/assets/tags-heading/#{f}"
  end

  def spotlight_enum
    [
      "Market Spotlight!",
      "Meet the Farmer",
      "Meet the Crafter",
      "Must-Have Tastes",
      "Buon appetito!",
      "Unique & Independent",
      "What's Fresh",
    ]
  end

  def self.spotlights   
    {
      "Market Spotlight!" => { icon: "tag-small-clock.png", color: "red" },
      "Meet the Farmer" => { icon: "tag-small-apple.png", color: "green" },
      "Meet the Crafter" => { icon: "tag-small-barrel.png", color: "orange" },
      "Must-Have Tastes" => { icon: "tag-small-crab.png", color: "red" },
      "Buon appetito!" => { icon: "tag-small-silverware.png", color: "green" },
      "Unique & Independent" => { icon: "tag-small-bag.png", color: "yellow" },
      "What's Fresh" => { icon: "tag-small-fish.png", color: "yellow" },
    }
  end

  def spotlight_header 
    Page.spotlights[spotlight] || { icon: "tag-small-clock.png", color: "red" }
  end
  
end