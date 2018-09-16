class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy, :publish, :unpublish]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 8).most_recent
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post #{@post.title} was succesfully created!"
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end


  def show
    @comments = @post.comments.order(created_at: :DESC)
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path,  notice: "Post was succesfully destroyed!"
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "Post was succesfully updated!"
    else
      render :edit
    end
  end

  def publish
    @post.update_column(:status, "published")
    redirect_to admin_posts_path, notice: "Published #{@post.title}"
  end

  def unpublish
    @post.update_column(:status, "draft")
    redirect_to admin_posts_path, notice: "Unpublished #{@post.title}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.includes(:comments).friendly.find(params[:id])
  end
end