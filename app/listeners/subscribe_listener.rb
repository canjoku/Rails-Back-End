class SubscribeListener
  def subscribe_user(email)
    SubscribeUserToMailingListJob.perform_async(email)
  end
end