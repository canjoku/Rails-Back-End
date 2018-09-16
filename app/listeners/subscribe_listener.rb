class SubscribeListener
  def send_welcome_mail(email)
    SendWelcomeEmailJob.perform_async(email)
  end
end