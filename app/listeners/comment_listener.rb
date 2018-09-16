class CommentListener
  def send_comment_mail(comment_id)
    SendNewCommentEmailJob.perform_async(comment_id)
  end
end