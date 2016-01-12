class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include GlobalID::Identification

  field :description, type: String
  field :borrower_email, type: String
  field :returned_at, type: Time
  field :last_notification_at, type: Time
  field :last_return_request_at, type: Time
  field :agreed_to_terms, type: Boolean

  validates_presence_of :description, :borrower_email, :agreed_to_terms

  scope :borrowed, -> { where(returned_at: nil) }
  scope :returned, -> { where(:returned_at.exists => true) }
end
