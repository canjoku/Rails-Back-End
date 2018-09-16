class SendWelcomeEmailJob
  include Sidekiq::Worker

  def perform(email)
    SendWelcomeEmail.call(email)
  end
end