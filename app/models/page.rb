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
  
end