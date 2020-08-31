class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @media = Medium.where(media_type: "movie" || "tv" || "Documentary")
    @watch = Watch.where(user: current_user)
    @favourites = Watch.where(user: current_user, favourite: true)
  end

  def profile
    @user = current_user
  end

  def watchlist
  end

  def favourites
    @favourites = Watch.where(user: current_user, favourite: true)
  end

  def buddies
    sent = policy_scope(Request).where(sender_id: current_user.id, status: 1)
    received = policy_scope(Request).where(receiver_id: current_user.id, status: 1)
    @buddies = sent.map { |request| [User.find_by(id: request.receiver_id), request.id] } + received.map { |request| [User.find_by(id: request.sender_id), request.id] }
  end
end
