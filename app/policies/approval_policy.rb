class ApprovalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user
  end

  def update?
    is_user?
  end

  def destroy?
    user
  end

  private

  def is_user?
    @record.giver == user
  end
end
