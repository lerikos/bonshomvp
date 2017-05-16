class Tag < ActiveRecord::Base
  has_many :skills
  has_many :users, through: :skills
  has_many :concerns
  has_many :alerts, through: :concerns
end
