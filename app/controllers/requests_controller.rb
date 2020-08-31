class RequestsController < ApplicationController
  def create
    sender = current_user
    receiver = User.find(params[:id])
    @request = Request.new(sender_id: sender.id, receiver_id: receiver.id)
    authorize @request
    @request.save
  end

  def update
    @request = Request.find(params[:id])
    @request[:status] = params[:confirmation]
    @request.save
    redirect_to user_buddies_path
  end

  def buddies
  end
end
