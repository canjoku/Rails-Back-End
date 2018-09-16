module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    post = Post.friendly.find(params[:post_id])
    redirect_to post_path(post), alert: "Comment has not been added, you must be signed in" unless session[:userinfo].present?
  end
end