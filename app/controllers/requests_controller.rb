class RequestsController < ApplicationController
  def create
    session[:return_to] = request.referer
    sender = current_user
    receiver = User.find(params[:user_id])
    @request = Request.new(sender_id: sender.id, receiver_id: receiver.id)
    authorize @request
    @request.save
    redirect_to session.delete(:return_to)
  end

  def update
    @request = authorize Request.find(params[:id])
    @request[:status] = params[:confirmation]
    @request.save
    redirect_to profile_buddies_path
  end

  def destroy
    @request = authorize Request.find(params[:id])
    @request.destroy
    redirect_to profile_buddies_path
  end
end
