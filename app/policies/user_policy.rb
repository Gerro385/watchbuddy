class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    current_user == User.find(params[:id])
  end

  def edit?
    update?
  end

  def destroy?
    current_user == User.find(params[:id])
  end

  def buddies?
    true
    # Request.find_by(sender_id: current_user.id, receiver_id: params[:id], status: 1).exists? || Request.find_by(sender_id: params[:id], receiver_id: current_user.id, status: 1).exists?
  end

  def seen?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
