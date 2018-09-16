class SendNewCommentEmail

  def self.call(comment_id)
    new(comment_id).call
  end

  attr_accessor :comment_id

  def initialize(comment_id)
    self.comment_id = comment_id
  end

  def call
    CommentMailer.new_comment_email(comment_id).deliver_now
  end
end