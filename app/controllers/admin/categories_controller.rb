class Admin::CategoriesController < AdminController
  before_action :authenticate

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username = ENV['USERNAME'] && password = ENV['PASSWORD']
    end
  end
  
end
