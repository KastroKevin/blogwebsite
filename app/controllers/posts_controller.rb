class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      ActionCable.server.broadcast 'posts', message: @post.title
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    end
  end

  def destroy
  end

  def search
    search = params[:title]
    @posts = Post.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end


  def profile
    @posts = Post.where(user_id: current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
