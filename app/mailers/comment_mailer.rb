class CommentMailer < ApplicationMailer
  def new_comment_email(comment_id)
    @comment = Comment.find(comment_id)
    mail(to: ENV.fetch["ADMIN_EMAIL"], subject: "A new comment has been posted")
  end
end