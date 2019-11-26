class UsersController < ApplicationController
  def index

    @doctors = policy_scope(User)
  end

  def show

  end
end
