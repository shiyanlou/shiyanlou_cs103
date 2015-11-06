class CommentsController < ApplicationController
  include UsersHelper
  before_action :require_login, except: [:create]

  def create
  end

  def destroy
  end
end
