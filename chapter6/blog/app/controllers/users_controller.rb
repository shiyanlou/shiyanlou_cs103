class UsersController < ApplicationController
  # 使用 app/helpers/users_helper.rb 中方法
  include UsersHelper

  # 除了登录页面，其他页面都需要在登录后访问
  before_action :require_login, except: [:login]

  # 登录用户
  def login
    if logged_in?
      redirect_to admin_posts_path
      return
    end
    # 只有 POST 访问时，才对用户进行认证
    if request.post?
      name = params[:user][:name]
      password = params[:user][:password]
      user = User.find_by(name: name)
      # 用户可以使用用户名或者邮箱登录
      if !user
        user = User.find_by(email: name)
      end
      if user && user.authenticate(password)
        log_in(user)
        # 登录成功后，跳转到博文页面
        redirect_to admin_posts_path
        return
      else
        flash.now[:danger] = "Invalid name or password"
      end
    end
  end

  # 退出登录
  def logout
    log_out if logged_in?
    redirect_to root_path
  end

  def show
    @user = User.first
  end

  # 用于更新管理员信息
  def update
    @user = User.find(params[:user][:id])
    if @user.update(user_params)
      flash[:success] = "Your password is: " + params[:user][:password]
      redirect_to profile_path
    else
      # 如果更新失败，则显示相关错误信息
      render 'show'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
