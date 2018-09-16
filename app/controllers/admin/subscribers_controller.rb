class Admin::SubscribersController < Admin::ApplicationController
  def index
    @subscribers = Subscriber.all.most_recent
  end
end