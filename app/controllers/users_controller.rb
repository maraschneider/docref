class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_doctor, only: [:show]
  # before_filter check if html, js etc
  def index
    @doctors = policy_scope(User)
    @search_location = params[:location]

    if params[:specialty_or_field].present?
      @doctors_array = []
      # @doctors = User.search_by_location(params[:location])
      @specialty = Specialty.search_by_specialty(params[:specialty_or_field])
      UserSpecialty.all.each do |user_spec|
        next if user_spec.specialty != @specialty.first
        @doctors_array << User.find(user_spec.user_id)
      end

      @field = Field.search_by_field(params[:specialty_or_field])
      UserField.all.each do |user_field|
        next if user_field.field != @field
        @doctors_array << User.find(user_field.user_id)
      end
      @doctors_array # instead of @doctors. Need to find a way to store the results there.
    else
      @doctors_array = policy_scope(User)
    end

    @markers = @doctors_array.map do |doctor|
      {
        lat: doctor.clinic.latitude,
        lng: doctor.clinic.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { doctor: doctor })
      }
    end
  end

  def show
    @approvals = Approval.all.select { |approval| approval.receiver_id == @doctor.id }
    @months = Date::ABBR_MONTHNAMES
  end

  private

  def set_doctor
    @doctor = User.find(params[:id])
    authorize @doctor
  end
end
