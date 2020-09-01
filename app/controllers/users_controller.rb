class UsersController < ApplicationController
  def index
    @user = current_user
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
    @watches = Watch.where(user: params[:user_id], seen: true)
  end

  def buddies
    @user = authorize User.find_by(params[:id])
    sent = Request.where(sender_id: params[:id], status: 1)
    received = Request.where(receiver_id: params[:id], status: 1)
    @buddies = sent.map { |request| User.find_by(id: request.receiver_id) } + received.map { |request| User.find_by(id: request.sender_id) }
  end
end
