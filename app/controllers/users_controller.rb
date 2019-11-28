class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_filter check if html, js etc
  def index
    @doctors = policy_scope(User)

    if params[:specialty_or_field].present?
      search_by_specialty_or_field(params[:specialty_or_field])
    elsif params[:specialty].present? || params[:field].present?
      specialty_result = search_by_specialty(params[:specialty]) if params[:specialty].present?
      field_result = search_by_field(params[:field]) if params[:field].present?
      @doctors = [specialty_result, field_result].flatten.uniq
    else
      @doctors
    end

    @doctors = doctors_by_spec_and_location(@doctors)
    @markers = get_info_for_map_markers(@doctors)
  end

  def show

  end

  private

  def search_by_specialty(search_input)
    Specialty.where(name: search_input).map {|p| p.users }.flatten.uniq
  end

  def search_by_field(search_input)
    Field.joins(:approvals).where(name: search_input).map {|p| p.users }.flatten.uniq
  end

  def search_by_specialty_or_field(search_input)
    @doctors = search_by_specialty(search_input)
    if @doctors == []
      @doctors = policy_scope(User)
      @doctors = search_by_field(search_input)
    end
    @doctors
  end

  def doctors_by_spec_and_location(docs_with_search_speciality)
    if params[:location].present?
      @doctors_nearby = search_location
      @doctors = docs_with_search_speciality.select { |doc| @doctors_nearby.include?(doc) }
      return @doctors
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
