class PostsController < ApplicationController

  def show
    @post = Post.includes(:comments).friendly.find(params[:id])
    @comments = @post.comments.order(created_at: :DESC)
  end
end