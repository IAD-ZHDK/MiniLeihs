class NotificationMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def email(item)
    @item = item
    @shop = ENV['SHOP_NAME']

    mail to: @item.borrower_email, subject: "#{@shop}: Borrowed item"
  end
end
