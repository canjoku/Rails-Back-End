class Auth0Controller < ApplicationController
  def callback
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to root_path, notice: "Succesfully logged in!"
  end

  def failure
    @error_msg = request.params['message']
  end

  def login
    redirect_to '/auth/auth0'
  end

  def logout
    session[:userinfo] = nil
    redirect_to root_path, notice: "Succesfully logged out!"
  end
end