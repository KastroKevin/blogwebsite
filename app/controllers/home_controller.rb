class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc).page params[:page]
    # ActionCable.server.broadcast 'posts', message: 'Hola Guapos'
  end
end
