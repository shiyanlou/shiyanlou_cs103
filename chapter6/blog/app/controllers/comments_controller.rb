class CommentsController < ApplicationController
  include UsersHelper
  before_action :require_login, except: [:create]

  # 创建评论
  def create
    # 查询该评论应该关联的文章
    @post = Post.find(params[:id])
    # 通过关联关系创建评论 
    @comment = @post.comments.create(comment_params)
    redirect_to show_post_path(@post)
  end

  # 删除评论
  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to show_post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
