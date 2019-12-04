class ClinicsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    false
  end

  def update?
    user
  end

  def delete?
    false
  end
end
