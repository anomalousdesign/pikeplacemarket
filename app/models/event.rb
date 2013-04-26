class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  extend FriendlyId
  friendly_id :title, use: :slugged
end
