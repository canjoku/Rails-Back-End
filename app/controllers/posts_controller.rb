class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 6).most_recent
  end

  def show
  end

  def set_post
    @post = Post.find(params[:id])
  end

end