class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def dashboard?
    user
  end

  def create?
    true # maybe an if-statement later for our validation of the email?
  end

  def update?
    user
  end

  def delete?
    false # what if a doctor wants to not be signed up anymore?
  end
end
