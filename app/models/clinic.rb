class Clinic < ApplicationRecord
  has_many :users
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :clinic_picture, ClinicPictureUploader
end
