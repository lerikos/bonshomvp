class Alert < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 140 }
  validates :issue, presence: true, length: { minimum: 3 }
  validates :action, presence: true, length: { minimum: 3 }
  validates :source, presence: true, length: { minimum: 3 }
  has_many :concerns
  has_many :tags, through: :concerns
  has_many :products, through: :tags
  has_many :p_users, through: :products, source: :users
  has_many :t_users, through: :tags, source: :users
  has_many :p_t_users, through: :products, source: :assigned_users

  def users
    (self.t_users.all + self.p_users.all + self.p_t_users).uniq
  end
end
