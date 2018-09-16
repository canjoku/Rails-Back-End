class NewPostMailer < ApplicationMailer
  def new_post_email(email, post_id)
    @post = Post.find(post_id)
    mail(to: email, subject: "A new post has been published!")
  end
end