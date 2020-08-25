class WatchPolicy < ApplicationPolicy

  def update?
    current_user == User.find(params[:id])
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
