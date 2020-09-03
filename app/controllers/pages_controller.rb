class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @media = Medium.where(media_type: "movie" || "tv" || "Documentary")
    @watch = Watch.where(user: current_user)
    @favourites = Watch.where(user: current_user, favourite: true)
    if user_signed_in?
      recs = MediaRecommendation.recommend_media(current_user)
      @recs_movie = recs[0]
      @recs_tv = recs[1]
    end
  end

  def profile
    @user = current_user
    @seen = Watch.where(user: current_user, seen: true)
    @favourites = Watch.where(user: current_user, favourite: true)
    @favourite_movies = @favourites.select { | watch| watch.medium.media_type == "movie" }
    @favourite_series = @favourites.select { | watch| watch.medium.media_type == "tv" }
  end

  def watchlist
    @watchlists = Watch.where(user: current_user, watchlist: true)
    @watchlist_movies = @watchlists.select { |watch| watch.medium.media_type == "movie" }
    @watchlist_series = @watchlists.select { |watch| watch.medium.media_type == "tv" }
  end

  def favourites
    @favourites = Watch.where(user: current_user, favourite: true)
    @favourite_movies = @favourites.select { | watch| watch.medium.media_type == "movie" }
    @favourite_series = @favourites.select { | watch| watch.medium.media_type == "tv" }
  end

  def seen
    @watches = Watch.where(user: current_user, seen: true)
  end

  def buddies
    @user = current_user
    sent = policy_scope(Request).where(sender_id: current_user.id, status: 1)
    received = Request.where(receiver_id: current_user.id, status: 1)
    @buddies = sent.map { |request| [User.find_by(id: request.receiver_id), request.id] } + received.map { |request| [User.find_by(id: request.sender_id), request.id] }
    @requests = Request.where(receiver_id: current_user, status: 0)
  end
end
