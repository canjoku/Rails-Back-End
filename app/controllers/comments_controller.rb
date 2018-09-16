class CommentsController < ApplicationController
  include Secured

  def create
    post = Post.friendly.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(post), notice: "Comment was added successfully"
    else
      redirect_to post_path(post), notice: "Comment was not added"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end