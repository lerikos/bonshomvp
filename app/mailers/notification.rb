class Notification < ApplicationMailer
  def send_notification(user, object)
    @user = user
    @obj = object
    mail(to: user.email, subject: "New alert for you.")
  end
end
