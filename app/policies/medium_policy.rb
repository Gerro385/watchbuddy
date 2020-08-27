class MediumPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def favorite?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
