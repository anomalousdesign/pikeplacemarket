class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  extend FriendlyId
  friendly_id :title, use: :slugged
  scope :active, where("start > ? or \"end\" > ?", Time.now, Time.now).where("under_review is null or under_review != ?", true)
  acts_as_taggable_on :tags
  attr_accessor :image
  after_save :process_image

  def process_image
  	if image.present?
  		e = Editables::EditableImage.create(name: "event-#{id}-thumb", image: image, width: "210", height: "130")
  		e.image.reprocess!
  		e = Editables::EditableImage.create(name: "Event #{id} Header", image: image, width: "400", height: "400")
  		e.image.reprocess!
  	end
  end

  def multiple_days?
    self.start.strftime("%m/%d") != self.end.strftime("%m/%d")
  end

end
