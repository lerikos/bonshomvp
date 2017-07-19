class AlertProduct < ApplicationRecord
  belongs_to :alert
  belongs_to :product
end
