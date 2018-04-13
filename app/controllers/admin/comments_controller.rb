class Admin::CommentsController < AdminController
  before_action :authenticate

  def destroy
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username = ENV['USERNAME'] && password = ENV['PASSWORD']
    end
  end
end
