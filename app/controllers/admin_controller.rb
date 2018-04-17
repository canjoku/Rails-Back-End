class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  @username = ENV['USERNAME']
  @password = ENV['PASSWORD']

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username = @username && password = @password
    end
  end
end

