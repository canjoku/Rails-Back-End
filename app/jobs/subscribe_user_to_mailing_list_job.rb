class SubscribeUserToMailingListJob
  include Sidekiq::Worker

  def perform(email)
    SubscribeUserToMailingList.call(email)
  end
end