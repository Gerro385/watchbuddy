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

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
