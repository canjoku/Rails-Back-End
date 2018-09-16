class SubscribersController < ApplicationController

  def index
    @subscriber = Subscriber.find_by_email(session[:userinfo].info.name)
  end

  def create
    subscriber = Subscriber.new(email)
    subscriber.save
    redirect_to subscribers_path, notice: "You have succesfully subscribed for email notifications"
  end

  def destroy
    subscriber = Subscriber.find(params[:id])
    subscriber.destroy
    redirect_to subscribers_path, notice: "You have succesfully cancelled your email notifications"
  end
  private
  def email
   { email: session[:userinfo].info.name }
  end
end