class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    @title = "#{@user.username}がフォロー中"
    render "show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @title = "#{@user.username}のフォロワー"
    render "show_follow"
  end
end
