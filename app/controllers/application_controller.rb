class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :logged_in

  def logged_in
    session[:userinfo].present?
  end
end
