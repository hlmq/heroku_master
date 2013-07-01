class CommentsController < ApplicationController

  def init_user
    @credential = User.find(1)
  end

  http_basic_authenticate_with name: "dhh", password: "password", only: :destroy
  #http_basic_authenticate_with name: @credential.user_name, password: @credential.password, only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to @post
  end
end
