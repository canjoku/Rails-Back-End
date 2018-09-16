class SendNewPostEmail

  def self.call(email, post_id)
    new(email, post_id).call
  end

  attr_accessor :email, :post_id

  def initialize(email, post_id)
    self.email = email
    self.post_id = post_id
  end

  def call
    NewpostMailer.new_post_email(email, post_id).deliver_now
  end
end