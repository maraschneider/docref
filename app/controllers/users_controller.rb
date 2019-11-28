class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :dashboard]
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

      search_by_approval_fields(@field, @doctors_array)
      search_by_user_fields(@field, @doctors_array)

      @doctors_array # instead of @doctors. Need to find a way to store the results there.
    else
      @doctors_array = policy_scope(User)
    end

    @doctors_results = doctors_by_spec_and_location(@doctors_array)
    @markers = get_info_for_map_markers(@doctors_results)
  end

  def show
    @approvals = Approval.all.select { |approval| approval.receiver_id == @doctor.id }
    # months required to show "Nov" instead of '11' on approval cards
    @months = Date::ABBR_MONTHNAMES
  end

  def dashboard
    @doctor = current_user
    @approvals = Approval.all.select { |approval| approval.receiver_id == @doctor.id }
    @months = Date::ABBR_MONTHNAMES
    @user = current_user
    authorize @user
  end

  private

  def search_by_user_fields(search_input, results)
    UserField.all.each do |user_field|
      next if user_field.field != search_input.first
      next if results.include?(user_field.user)
      results << user_field.user
    end
    return results
  end

  def search_by_approval_fields(search_input, results)
    ApprovalField.all.each do |approval_field|
      next if approval_field.field != search_input.first
      next if results.include?(approval_field.approval.receiver)
      results << approval_field.approval.receiver
    end
    return results
  end

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

  def get_info_for_map_markers(results)
    results.map do |doctor|
      {
        lat: doctor.clinic.latitude,
        lng: doctor.clinic.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { doctor: doctor }),
        image_url: helpers.asset_url('pin-mint.png')
      }
    end
  end

  def set_doctor
    @doctor = User.find(params[:id])
    authorize @doctor
  end
end
