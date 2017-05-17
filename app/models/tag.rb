class Tag < ActiveRecord::Base
  has_many :preferences
  has_many :users, through: :preferences
  has_many :concerns
  has_many :alerts, through: :concerns
end
