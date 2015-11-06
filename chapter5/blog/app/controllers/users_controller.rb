class UsersController < ApplicationController
  def login
  end

  def logout
  end

  def show
    @user = User.first
  end

  def update
    @user = User.find(params[:user][:id])
    @user.update(user_params)
    redirect_to profile_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
