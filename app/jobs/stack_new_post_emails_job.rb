class StackNewPostEmailsJob
  include Sidekiq::Worker

  def perform(post_id)
    StackNewPostEmails.call(post_id)
  end
end