class ClinicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_clinic, only: [:edit, :update]

  def edit
  end

  def update
    @clinic.update(clinic_params)
    if @clinic.save
     # redirect_to dashboard_path(@user)
    end
  end

  private

  def set_clinic
    @clinic = current_user.clinic
    authorize @clinic
  end

  def clinic_params
    params.require(:clinic).permit(:name, :address, :phone_number, :email, :website, :clinic_picture, :consultation_times, :description)
  end
end
