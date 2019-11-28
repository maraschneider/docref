class ApprovalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    # def show?
    #   true
    # end

    def create?
      true
    end

    def update?
      is_user?
    end

    def delete?
      is_user?
    end

    private

    def is_user?
      record.user == user
    end
  end
end
