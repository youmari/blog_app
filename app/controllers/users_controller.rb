class UsersController < ApplicationController
  def index
    @users = User.all
    @title = '- Users'
  end

  def show
    @title = "- #{User.find(params[:id]).name}"
    @user = User.find(params[:id])
    @recent_posts = User.three_recent_posts(@user)
  end
end
