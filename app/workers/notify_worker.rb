class NotifyWorker
  include Sidekiq::Worker

  def perform(email)
    i = ENV['NOTIFY_INTERVAL'].to_i.days.to_i

    items = Item.borrowed.where(borrower_email: email).all.to_a.select do |item|
      if item.last_notification_at.nil?
        (Time.now - item.created_at).to_i > i
      else
        (Time.now - item.last_notification_at).to_i > i
      end
    end

    if items.size > 0
      NotificationMailer.notification_email(email, items).deliver_now

      items.each do |item|
        item.update!(last_notification_at: Time.now)
      end
    end
  end
end
