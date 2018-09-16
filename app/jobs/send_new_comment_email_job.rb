class SendNewCommentEmailJob
  include Sidekiq::Worker

  def perform(comment_id)
    SendNewCommentEmail.call(comment_id)
  end
end