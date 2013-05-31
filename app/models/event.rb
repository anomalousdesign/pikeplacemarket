class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  extend FriendlyId
  friendly_id :title, use: :slugged
  scope :active, where("start > ? or \"end\" > ?", Time.now, Time.now)
  acts_as_taggable_on :tags
end
