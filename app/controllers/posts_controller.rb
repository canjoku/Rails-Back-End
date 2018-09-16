class PostsController < ApplicationController

  def index
    @posts = Post.published.most_recent.paginate(page: params[:page], per_page: 8)
  end

  def show
    @post = Post.includes(:comments).friendly.find(params[:id])
    @comments = @post.comments.order(created_at: :DESC)
  end
end
