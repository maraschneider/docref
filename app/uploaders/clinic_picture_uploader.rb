class ClinicPictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
