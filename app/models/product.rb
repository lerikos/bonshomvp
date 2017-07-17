class Product < ActiveRecord::Base
  has_many :tags
  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_many :alert_products, dependent: :destroy
  has_many :alerts, through: :alert_products
  has_many :subscribers, dependent: :destroy
  has_many :users, through: :subscribers
  has_many :assigned_users, through: :tags, source: :users
end
