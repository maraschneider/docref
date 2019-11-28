class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_filter check if html, js etc
  def index
    @doctors = policy_scope(User)

    if params[:specialty_or_field].present?
      search_by_specialty_or_field(params[:specialty_or_field])
    else
      @doctors
    end

    #search_by_approval_fields(@field, @doctors)
    #search_by_user_fields(@field, @doctors)

    @doctors = doctors_by_spec_and_location(@doctors)
    @markers = get_info_for_map_markers(@doctors)
  end

  def show

  end

  private

  def search_by_specialty(search_input)
    @doctors = @doctors.joins(:specialties).where(specialties: {name: search_input})
  end

  def search_by_field(search_input)
    @doctors = @doctors.joins(:fields).where(fields: {name: search_input})
  end

  def search_by_specialty_or_field(search_input)
    @doctors = search_by_specialty(search_input)
    if @doctors == []
      @doctors = search_by_field(search_input)
    end
    @doctors
  end

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
end
