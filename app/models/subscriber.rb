class Subscriber < ApplicationRecord

  include Wisper::Publisher
  after_create :subscribe_user_to_mailing_list

  validates :email, presence: true, uniqueness: true
  scope :most_recent, -> { order(created_at: :desc) }
  scope :alphabetical_order, -> { order(email: :asc) }

  private
  def subscribe_user_to_mailing_list
    broadcast(:subscribe_user, self.email)
  end

end