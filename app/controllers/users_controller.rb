class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_doctor, only: [:show]

  def index
    @doctors = policy_scope(User)
  end

  def show
  end

  private

  def set_doctor
    @doctor = User.find(params[:id])
    authorize @doctor
  end
end
