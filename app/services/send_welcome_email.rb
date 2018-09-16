class SendWelcomeEmail

  def self.call
    new(email).call
  end
  attr_accessor :email

  def initialize(email)
    self.email = email
  end

  def call
    SubscriptionMailer.welcome_email(email).deliver_now
  end
end