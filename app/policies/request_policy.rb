class RequestPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    true
  end

  def buddies?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end