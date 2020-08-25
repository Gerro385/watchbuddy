class WatchesController < ApplicationController
  def index
    @watches = Watch.all
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.save
  end

  def update
    @watch = Watch.find(params[:id])
    @watch.update(watch_params)
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
  end

  private

  # params permission
  def watch_params
    params.require(:watch).permit(:rating, :private, :favourite)
  end
end
