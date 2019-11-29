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
    is_user?
  end

  def delete?
    false
  end

  private

  def is_user?
    record.user == user
  end
end
