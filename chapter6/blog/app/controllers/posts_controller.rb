class PostsController < ApplicationController
  include UsersHelper
  before_action :require_login, except: [:index, :show]

  def index
    # 查询返回所有的文章，按创建时间倒序排序
    @posts = Post.order(created_at: :desc)
  end

  def show
    # 根据文章id查询文章
    @post = Post.find(params[:id])
    # 在视图中，会用到此实例对象
    @comment = Comment.new
  end

  # 管理文章的首页
  def admin_index
    @posts = Post.order(created_at: :desc)
  end

  # 创建新文章页面
  def new
    @post = Post.new
  end

  # 更新文章的页面 
  def edit
    @post = Post.find(params[:id])
  end

  # 创建文章
  def create
    # 根据传递的参数创建文章
    @post = Post.new(post_params)
    # 如果创建成功则显示该文章
    if @post.save
      redirect_to show_post_path(@post)
    else
      # 创建失败，在渲染创建文章的页面，同时会显示相关的错误信息
      render 'new'
    end
  end

  # 更新文章
  def update
    @post = Post.find(params[:post][:id])
    # 更新成功则返回管理页面
    if @post.update(post_params)
      flash[:success] = "Update post with id: #{@post.id}  successfully"
      redirect_to admin_posts_path
    else
      # 更新失败则显示更新页面，同时会显示相关的错误信息
      render 'edit'
    end

  end

  # 删除文章
  def destroy
    post = Post.find(params[:id])
    post.destroy
    # 同时 flash 一条删除成功的信息
    flash[:danger] = "Dlete post with id: #{post.id} successfully"
    redirect_to admin_posts_path
  end

  private
  # 只允许params[:post][:title] 和 params[:post][:text] 被访问
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
