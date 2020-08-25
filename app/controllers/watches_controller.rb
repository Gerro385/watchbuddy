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
