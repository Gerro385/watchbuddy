class WatchesPolicy < ApplicationPolicy

  def update?
    true
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
