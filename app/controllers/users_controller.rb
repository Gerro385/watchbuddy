class UsersController < ApplicationController
  def index
    @users = policy_scope(User).all

    if params[:query].present?
      @users = User.search_by_email_and_first_name_and_last_name(params[:query]).reject { |user| user == current_user }
    end

  end

  def show
    @user = authorize User.find(params[:id])
  end

  def watchlist
  end

  def seen
  end
end
