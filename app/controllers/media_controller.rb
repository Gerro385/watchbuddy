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
    medium_fetch = MovieFetch.new
    @medium = Medium.new(medium_fetch.medium_hash(params[:tmdb_id]))
    authorize @medium
    medium_exist = Medium.find_by(imdb_id: @medium.imdb_id)
    if medium_exist.nil?
      @medium.save
      redirect_to medium_path(@medium)
    else
      redirect_to medium_path(medium_exist)
    end
  end

  private

  # params permission
  def medium_params
    params.require(:medium).permit(:title, :runtime, :genres, :description, :language, :rating, :media_type, :imdb_id, :total_seasons, :tmdb_id, :origin_country, :poster, :first_air_date, :last_air_date)
  end
end
