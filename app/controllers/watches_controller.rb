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
    if @watch.update(watch_params)
      redirect_to bookings_path, notice: 'Booking was updated'
    else
      render :edit
    end
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
