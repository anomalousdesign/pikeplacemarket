class MerchantCategory < ActiveRecord::Base
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :merchant_categorizations
  has_many :merchants, through: :merchant_categorizations
end
