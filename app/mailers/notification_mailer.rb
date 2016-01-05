class NotificationMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def notification_email(email, items)
    @items = items
    @shop = ENV['SHOP_NAME']

    mail to: email, cc: ENV['MAIL_SENDER'], subject: "Your borrowed items from the #{@shop}"
  end
end
