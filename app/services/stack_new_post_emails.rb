class StackNewPostEmails

  def self.call
    new(post_id).call
  end

  attr_accessor :post_id

  def initialize(post_id)
    self.post_id = post_id
  end

  def call
    Subscriber.all.each do |subscriber|
      SendNewPostEmailJob.perform_async(subscriber.email, post_id)
    end
  end
end