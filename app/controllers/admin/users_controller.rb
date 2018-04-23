class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
end
