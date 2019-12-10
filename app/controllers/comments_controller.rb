class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_url
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end
end