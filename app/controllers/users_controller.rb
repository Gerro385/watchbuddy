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
    @seen = @user.watches.where(seen: true)
    @favourite_movies = []
    @user.watches.each do |watch|
      @favourite_movies << watch if watch.medium.media_type == "movie" && watch.favourite = true
    end
    @favourite_series = []
    @user.watches.each do |watch|
      @favourite_series << watch if watch.medium.media_type == "tv" && watch.favourite = true
    end
  end


  def watchlist
  end

  def seen
    authorize current_user
    @watches = Watch.where(user: params[:user_id], seen: true)
  end

  def favourites
    authorize current_user
    @favourites = Watch.where(user: params[:user_id], favourite: true)
    @favourite_movies = @favourites.select { |watch| watch.medium.media_type == "movie" }
    @favourite_series = @favourites.select { |watch| watch.medium.media_type == "tv" }
  end

  def buddies
    @user = authorize User.find_by(params[:id])
    sent = Request.where(sender_id: params[:id], status: 1)
    received = Request.where(receiver_id: params[:id], status: 1)
    @buddies = sent.map { |request| User.find_by(id: request.receiver_id) } + received.map { |request| User.find_by(id: request.sender_id) }
  end
end
