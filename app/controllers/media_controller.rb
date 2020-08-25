class MediaController < ApplicationController
  # select item from search go for create, if id already in local db go to show, if not in db do create
  # then go to show
  def index
    @media = policy_scope(Medium).all
  end

  def show
    # media is the db
    # display instance
    @medium = authorize Medium.find(params[:id])
  end

  def create
    @medium = authorize Medium.new(medium_params)
    @medium.save
  end

  private

  # params permission
  def medium_params
    params.require(:medium).permit(:title, :runtime, :genres, :description, :language, :rating, :media_type, :imdb_id, :total_seasons, :tmdb_id, :origin_country, :poster, :first_air_date, :last_air_date)
  end
end
