class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include GlobalID::Identification

  field :description, type: String
  field :borrower_email, type: String
  field :returned_at, type: Time
  field :last_notification_at, type: Time

  validates_presence_of :description, :borrower_email
end
