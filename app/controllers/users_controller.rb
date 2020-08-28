class UsersController < ApplicationController
  def index
    @users = policy_scope(User).all
  end

  def show
    @user = authorize User.find(params[:id])
  end

  def watchlist
  end

  def seen
  end

  def buddies
    @user = authorize current_user
  end
end
