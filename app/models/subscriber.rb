class Subscriber < ApplicationRecord

  include Wisper::Publisher
  after_save :publish_creation

  validates :email, presence: true, uniqueness: true
  scope :most_recent, -> { order(created_at: :desc) }

  private
  def publish_creation
    broadcast(:send_welcome_mail, self.email)
  end

end