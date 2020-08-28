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
    @favourites = Watch.all.select(user: current_user, favourites: true)
  end
end
