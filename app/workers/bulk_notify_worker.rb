class BulkNotifyWorker
  include Sidekiq::Worker

  def perform
    Item.distinct(:borrower_email).each do |email|
      NotifyWorker.perform_async(email)
    end
  end
end
