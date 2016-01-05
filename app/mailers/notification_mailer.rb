class NotificationMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def notification_email(item)
    @item = item
    @shop = ENV['SHOP_NAME']

    mail to: @item.borrower_email, cc: ENV['MAIL_SENDER'], subject: "#{@shop}: Borrowed item"
  end
end
