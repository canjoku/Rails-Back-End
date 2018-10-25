class Admin::SubscribersController < Admin::ApplicationController
  def index
    @subscribers = Subscriber.all.alphabetical_order
  end
end