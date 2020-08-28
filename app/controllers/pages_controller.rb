class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = current_user
  end

  def watchlist
    @watches = Watch.all.select(user: current_user, seen: false)
  end
end
