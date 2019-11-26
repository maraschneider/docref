class UsersController < ApplicationController
  def index
    @doctors = policy_scope(User)

    @markers = @doctors.map do |doctor|
      {
        lat: doctor.clinic.latitude,
        lng: doctor.clinic.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { doctor: doctor })
      }
    end
  end

  def show

  end
end
