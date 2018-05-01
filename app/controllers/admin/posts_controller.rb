class Admin::PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 6)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      flash[:success] = "Post was succesfully created!"
      redirect_to admin_post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    flash[:success] = "Post was succesfully deleted!"
    redirect_to admin_posts_url
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post was succesfully updated!"
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :description, :banner_image_url)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
