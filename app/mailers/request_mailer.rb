class RequestMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def request_email(item)
    @item = item
    @shop = ENV['SHOP_NAME']

    mail to: @item.borrower_email, cc: ENV['MAIL_SENDER'], subject: 'Request for immediate return'
  end
end
