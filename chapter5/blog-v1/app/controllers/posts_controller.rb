class PostsController < ApplicationController
  include UsersHelper
  before_action :require_login, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end

  def admin_index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save
    redirect_to @post
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
