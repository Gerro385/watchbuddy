class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    p ENV['TMDB_KEY']
  end

  def profile
    @user = current_user
  end

  def watchlist
  end
end
