class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to root_path, notice: "You have succesfully subscribed for email notifications"
    else
      redirect_to root_path, notice: "You submission was unsuccesful"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

end