class NewPostListener
  def send_new_post_notification
    SendNotificationEmailsJob.perform_async
  end
end