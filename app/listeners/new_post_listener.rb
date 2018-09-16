class NewPostListener
  def send_new_post_mail(post_id)
    StackNewPostEmailsJob.perform_async(post_id)
  end
end