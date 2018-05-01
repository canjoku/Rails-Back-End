class Admin::UsersController < AdminController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.username} to Tony's Blog App!"
      redirect_to admin_user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
