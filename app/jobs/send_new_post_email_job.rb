class SendNewPostEmailJob
  include Sidekiq::Worker

  def perform(email, post_id)
    SendNewPostEmail.call(email, post_id)
  end
end