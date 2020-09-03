class WatchesController < ApplicationController
  # layout false, only: :favourite
  # layout "application", :except => :favourite


  def index
    @watches = policy_scope(Watch).all
  end

  def create
    @watch = authorize Watch.new(watch_params)
    @watch.save
  end

  def update
    set_watch
    @watch.update(watch_params)
  end

  def favourite
    @medium = Medium.find(params[:medium_id])
    authorize @medium
    @watch = Watch.find_or_initialize_by(user: current_user, medium_id: params[:medium_id].to_i)
    @watch.toggle(:favourite)
    @watch.seen = true
    @watch.save!

    respond_to do |format|
      format.html { redirect_to medium_path(@medium) }
      format.json { render json: { is_saved: @watch.favourite } }
    end
    # if params[:show].present?
    #   redirect_to medium_path(@medium)
    # else
    #   redirect_to root_path
    # end
  end

  def watchlist
    @medium = Medium.find(params[:medium_id])
    authorize @medium
    @watch = Watch.find_or_initialize_by(user: current_user, medium_id: params[:medium_id].to_i)
    @watch.toggle(:watchlist)
    @watch.save!

    respond_to do |format|
      format.html { redirect_to medium_path(@medium) }
      format.json { render json: { is_saved: @watch.watchlist } }
    end
  end

  def rate

    @medium = Medium.find(params[:medium_id])
    authorize @medium
    @watch = Watch.find_or_initialize_by(user: current_user, medium_id: params[:medium_id].to_i)
    @watch.rating = params[:rating]
    @watch.description = params[:desc]
    @watch.seen = true
    @watch.save!

     # respond_to do |format|
     # format.html { redirect_to medium_path(@medium) }
     # format.json { render json: { rating: @watch.rating } }
     # end
  end


  def seen
    @medium = Medium.find(params[:medium_id])
    authorize @medium
    @watch = Watch.find_or_initialize_by(user: current_user, medium_id: params[:medium_id].to_i)
    @watch.toggle(:seen)
    @watch.watched_date = Date.today if @watch.seen
    @watch.save!

     respond_to do |format|
     format.html { redirect_to medium_path(@medium) }
     format.json { render json: { is_saved: @watch.seen } }
     end
  end

  def destroy
    set_watch
    @watch.destroy
  end

  private

  def set_watch
    @watch = authorize Watch.find(params[:id])
  end

  # params permission
  def watch_params
    params.require(:watch).permit(:rating, :private, :favourite)
  end
end
