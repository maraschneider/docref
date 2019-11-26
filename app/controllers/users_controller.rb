class UsersController < ApplicationController
  def index

    @doctors = policy_scope(User)

    @clinics = Clinic.geocoded #returns flats with coordinates

    @markers = @clinics.map do |clinic|
      {
        lat: clinic.latitude,
        lng: clinic.longitude
      }
    end
  end

  def show

  end
end
