class MediumPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end


  def favourite?
    true
  end


  def watchlist?
    true
  end
  
  def seen?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
