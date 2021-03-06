class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :dashboard]
  before_action :set_doctor, only: [:show]
  before_action :set_current_user, only: [:edit, :update, :dashboard]

  # before_filter check if html, js etc
  def index
    @doctors = policy_scope(User)

    if params[:specialty_or_field].present?
      search_by_specialty_or_field(params[:specialty_or_field])
    elsif params[:specialty].present? || params[:field].present? || params[:name].present? || params[:location].present?
      @doctors = search_doctor_by_specialty(params[:specialty]) if params[:specialty].present?
      @doctors = search_doctor_by_field(params[:field]) if params[:field].present?
      @doctors = search_doctor_by_name(params[:name]) if params[:name].present?
      @doctors = search_doctor_by_location if params[:location].present?
    else
      @doctors
    end

    @markers = get_info_for_map_markers(@doctors) if @doctors != []
  end

  def show
    if params[:keyword_search].present? && params[:approval_field].present?
      keyword_results = Approval.where(receiver: @doctor).search_approvals_by_keyword(params[:keyword_search])
      field_results = search_approvals_by_field(params[:approval_field])
      @approvals = [keyword_results, field_results].flatten
      @approvals = @approvals.select { |i| @approvals.count(i) > 1 }.uniq
    elsif params[:keyword_search].present?
      @approvals = Approval.where(receiver: @doctor).search_approvals_by_keyword(params[:keyword_search])
    elsif params[:approval_field].present?
      @approvals = search_approvals_by_field(params[:approval_field])
    else
      results = Approval.all.select { |approval| approval.receiver_id == @doctor.id }
      @approvals = results.sort_by(&:"created_at").reverse
    end
    # months required to show "Nov" instead of '11' on approval cards
    @months = Date::ABBR_MONTHNAMES
    respond_to do |format|
      format.html { render 'users/show' }
      format.js
    end
  end

  def dashboard
    results = Approval.all.select { |approval| approval.giver_id == current_user.id }
    @approvals = results.sort_by(&:"created_at").reverse
    @months = Date::ABBR_MONTHNAMES
    @clinic = current_user.clinic
    @doctor = current_user
    @user = current_user
    authorize @user
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to dashboard_path(@user)
    end
  end

  private

  def search_doctor_by_specialty(search_input)
    # Specialty.where('lower(name) = ?', search_input.downcase).map {|p| p.users }.flatten.uniq
    @specialty = Specialty.joins(:users).where(users: @doctors).search_by_specialty(search_input)
    @doctors = @specialty.map { |p| p.users }.flatten.uniq
  end

  def search_doctor_by_field(search_input)
    if search_input.is_a? Array
      search_input.each do |input|
        @approvals = Approval.where(receiver: @doctors)
        @field = Field.search_by_field(input)
        @doctors = @approvals.joins(:fields).where(fields: {id: @field}).map {|p| p.receiver }.flatten.uniq
        # @doctors = @field.joins(:approvals).where(approvals: { receiver: @doctors }).map {|p| p.users }.flatten.uniq
      end
    else
      @approvals = Approval.where(receiver: @doctors)
      @field = Field.search_by_field(search_input)
      @doctors = @approvals.joins(:fields).where(fields: {id: @field}).map {|p| p.receiver }.flatten.uniq
      # @doctors = @field.joins(:approvals).where(approvals: { receiver: @doctors }).map { |p| p.users }.flatten.uniq
      # Field.joins(:approvals).where('lower(name) = ?', search_input.downcase).map {|p| p.users }.flatten.uniq
    end
    @doctors
  end

  def search_by_specialty_or_field(search_input)
    search_doctor_by_specialty(search_input)
    if @doctors == []
      @doctors = policy_scope(User)
      @doctors = search_doctor_by_field(search_input)
      params[:field] = @field.first.name if @doctors != []
    else
      params[:specialty] = @specialty.first.name
    end
  end

  def search_doctor_by_name(search_input)
    @doctors = User.search_by_name(search_input).where(id: @doctors)
  end

  def search_doctor_by_location
    if params[:location].present?
      @doctors_nearby = search_location
      @doctors = @doctors.select { |doc| @doctors_nearby.include?(doc) }
      return @doctors
    else
      return @doctors
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
    @approvals = Approval.all
    search_input.each do |input|
      @approvals = Approval.joins(:fields).where(receiver: @doctor).where(id: @approvals).where(fields: {name: input}).uniq # how do we prevent SQL injections?
    end
    @approvals
  end

  def set_doctor
    @doctor = User.find(params[:id])
    authorize @doctor
  end

  def set_current_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :position, :bio, :profile_picture)
  end
end
