class Tag < ActiveRecord::Base
  has_many :preferences, dependent: :destroy
  has_many :users, through: :preferences
  has_many :concerns, dependent: :destroy
  has_many :alerts, through: :concerns
  has_many :product_tags, dependent: :destroy
  has_many :products, through: :product_tags
end
