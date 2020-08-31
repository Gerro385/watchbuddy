class RequestsController < ApplicationController
  def create
    sender = current_user
    receiver = User.find(params[:id])
    @request = Request.new(sender_id: sender.id, receiver_id: receiver.id)
    authorize @request
    @request.save
  end

  def buddies
    authorize current_user
    sent = Request.where(sender_id: current_user.id, status: 1)
    received = Request.where(receiver_id: current_user.id, status: 1)
    @buddies = sent.map { |request| User.find_by(id: request.receiver_id) } + received.map { |request| User.find_by(id: request.sender_id) }
  end
end
