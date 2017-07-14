class Notification < ApplicationMailer
  def send_notification(user, object)
    @user = user
    @obj = object
    @url = "http://darker.cf/#{@obj.title.downcase.gsub(' ', '-')}"
    mail(to: user.email, subject: "New alert for you.")
  end
end
