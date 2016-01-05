class NotifyWorker
  include Sidekiq::Worker

  def perform(email)
    items = Item.borrowed.where(borrower_email: email).all.to_a.select do |item|
      (Time.now - (item.last_notification_at || 0)).to_i > ENV['NOTIFY_INTERVAL'].to_i.days.to_i
    end

    if items.size > 0
      NotificationMailer.notification_email(email, items).deliver_now

      items.each do |item|
        item.update!(last_notification_at: Time.now)
      end
    end
  end
end
