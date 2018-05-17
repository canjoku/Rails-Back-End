class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 15).ordered_by_username
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.username} to Tony's Blog App!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user_posts = @user.posts.paginate(page: params[:page], per_page: 6)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User profile was succesfully updated!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end