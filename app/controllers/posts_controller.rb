class PostsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "password", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
      #redirect_to action: :show, id: @post.id
    else
      render "new"                # the object @post will be passed back to the view (same as !isPostback() in C#)
      #redirect_to action: :new   # the object @post will be lost because browser will issue another request
    end
  end

  #def create
  #  render text: params[:post].inspect
  #end

  def update
    @post = Post.find(params[:id])

    # beware of update method. It is private
    # to update record, we can use update_attributes! or update_attributes
    # The bang (!) lets us know if there is error, an exception will be raised
    begin
      if @post.update_attributes!(params[:post])
        redirect_to @post
      end
    rescue
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

end
