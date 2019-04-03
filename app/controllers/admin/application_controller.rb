class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username = ENV.fetch("ADMIN_USER") && password = ENV.fetch("ADMIN_PASSWORD")
    end
  end

  layout "admin"
end