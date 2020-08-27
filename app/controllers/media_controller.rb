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
    medium_fetch = MovieFetch.new # using this for the class method which pulls movie data from the tmdb API
    @medium = Medium.new(medium_fetch.medium_hash(params[:tmdb_id]))
    authorize @medium # allow creation of medium through pundit
    medium_exist = Medium.find_by(tmdb_id: @medium.tmdb_id) # variable contains instance of movie from our db if the tmdb_id matches something from our db, otherwise nil
    if medium_exist.nil? # checks if we have a match in our db
      @medium.save # if not, it adds it to our db and redirects the user towards the listing
      redirect_to medium_path(@medium)
    else
      redirect_to medium_path(medium_exist) # if so, it redirects to the already existent listing
    end
  end

  private

  # params permission
  def medium_params
    params.require(:medium).permit(:title, :runtime, :genres, :description, :language, :rating, :media_type, :imdb_id, :total_seasons, :tmdb_id, :origin_country, :poster, :first_air_date, :last_air_date)
  end
end
