class Product < ActiveRecord::Base
  has_many :tags
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :alerts, through: :tags, source: :alerts
  has_many :subscribers
  has_many :users, through: :subscribers
  has_many :assigned_users, through: :tags, source: :users
end
