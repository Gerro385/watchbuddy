class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
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
    @buddies = sent.map { |request| User.find_by(id: request.receiver_id) } + received.map { |request| User.find_by(id: request.sender_id) }  
  end
end
