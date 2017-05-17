class Concern < ActiveRecord::Base
  belongs_to :tag
  belongs_to :alert
end
