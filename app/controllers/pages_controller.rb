class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @media = Medium.where(media_type: "movie")
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
end
