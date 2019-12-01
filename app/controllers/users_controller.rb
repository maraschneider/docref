class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :dashboard]
  before_action :set_doctor, only: [:show]

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
    if params[:approval_field].present?
      @approvals = search_approvals_by_field(params[:approval_field])
    elsif params[:keyword_search].present?
      @approvals = Approval.search_approvals_by_keyword(params[:keyword_search])
    else
      @approvals = Approval.all.select { |approval| approval.receiver_id == @doctor.id }
    end
    # months required to show "Nov" instead of '11' on approval cards
    @months = Date::ABBR_MONTHNAMES
    @approvals
  end

  def dashboard
    @doctor = current_user
    @re_approvals = Approval.all.select { |approval| approval.receiver_id == @doctor.id }
    @gi_approvals = Approval.all.select { |approval| approval.giver_id == @doctor.id }
    @months = Date::ABBR_MONTHNAMES
    @user = current_user
    authorize @user
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

  def search_approvals_by_field(search_input)
    counts = Hash.new(0)
    @approvals = []
    search_input.each do |input|
      results = Approval.joins(:fields).where(receiver: @doctor).where(fields: {name: input}).uniq
      results.each do |result|
        counts[result] += 1
      end
    end
    counts.each do |key, value|
      @approvals << key if value == search_input.count
    end
    @approvals
  end

  #def search_approvals_by_keyword(search_input)
  #  Approval.joins(:fields).where(reciever: @doctor).where(name: search_input).map {|p| p.users }.flatten.uniq
  #end

  def set_doctor
    @doctor = User.find(params[:id])
    authorize @doctor
  end
end
