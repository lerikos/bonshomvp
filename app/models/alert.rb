class Alert < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 140 }
  validates :issue, presence: true, length: { minimum: 3 }
  validates :action, presence: true, length: { minimum: 3 }
  validates :source, presence: true, length: { minimum: 3 }
  has_many :concerns
  has_many :tags, through: :concerns
end
