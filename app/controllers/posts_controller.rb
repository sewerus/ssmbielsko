class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :delete]
  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to '/posts'
    else
      render 'edit'
    end
  end


  private
  def post_params
    params.require(:post).permit(:content, :title, :img, :author)
  end
end
