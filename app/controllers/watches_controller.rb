class WatchesController < ApplicationController
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
    @watch.save

    if params[:show].present?
      redirect_to medium_path(@medium)
    else
      redirect_to root_path
    end
  end

  def destroy
    set_watch
    @watch.destroy
  end

  def seen
    @watches.where(user: current_user, seen: true)
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
