class Alert < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 140 }
  validates :issue, presence: true, length: { minimum: 3 }
  validates :action, presence: true, length: { minimum: 3 }
  validates :source, presence: true, length: { minimum: 3 }
  has_many :concerns, dependent: :destroy
  has_many :tags, through: :concerns
  has_many :products, through: :tags
  has_many :alert_products, dependent: :destroy
  has_many :products, through: :alert_products
  has_many :p_users, through: :products, source: :users
  has_many :t_users, through: :tags, source: :users

  def users
    (self.t_users.all + self.p_users.all).uniq
  end
end
