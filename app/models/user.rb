class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 25 }
  validates :firstname, presence: true
  validates :lastname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
             uniqueness: { case_sensitive: false },
             format: { with: VALID_EMAIL_REGEX }
  has_many :preferences
  has_many :tags, through: :preferences
  has_many :t_alerts, through: :tags, source: :alerts
  has_many :subscribers
  has_many :products, through: :subscribers
  has_many :p_alerts, through: :products, source: :alerts

  def alerts
    (self.t_alerts.all + self.p_alerts.all).uniq.sort!{|a,b| a.created_at <=> b.created_at}.reverse
  end
end
