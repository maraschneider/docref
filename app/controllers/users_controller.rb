class UsersController < ApplicationController
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
      return @doctors_array # instead of @doctors. Need to find a way to store the results there.
    else
      @doctors_array = User.all
    end
  end

  def show

  end
end
