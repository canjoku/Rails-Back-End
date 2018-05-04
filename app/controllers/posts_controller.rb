class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @paginate = Post.paginate(page: params[:page], per_page: 6)
    @posts = @paginate.by_date
  end

  def show
  end

  def set_post
    @post = Post.find(params[:id])
  end

end