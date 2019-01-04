class SendNotificationEmailsJob
  include Sidekiq::Worker

  def perform
    SendNotificationEmails.call
  end
end