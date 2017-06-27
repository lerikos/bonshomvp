class NotificationSenderJob < ActiveJob::Base
  queue_as :default

  def perform alert
    alert.tags.each do |tag|
      tag.users.each do |user|
        Notification.send_notification(user, alert).deliver_later
      end
    end
  end
end
