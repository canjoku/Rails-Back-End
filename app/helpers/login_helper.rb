module LoginHelper

  def logged_in
    session[:userinfo].present?
  end

end