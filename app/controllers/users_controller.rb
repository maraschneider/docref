class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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

    @doctors_results = doctors_by_spec_and_location(@doctors_array)

    @markers = @doctors_results.map do |doctor|
      {
        lat: doctor.clinic.latitude,
        lng: doctor.clinic.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { doctor: doctor })
      }
    end
  end

  def show

  end

  private

  def doctors_by_spec_and_location(docs_with_search_speciality)
    if params[:location].present?
      @doctors_nearby = search_location
      @doctors_result = docs_with_search_speciality.select { |doc| @doctors_nearby.include?(doc) }
      return @doctors_result
    else
      return docs_with_search_speciality
    end
  end

  def search_location
    @clinics = Clinic.near(params[:location], 10)
    @doctors_nearby = @clinics.map { |clinic| clinic.users }
    @doctors_nearby.flatten
  end
end
