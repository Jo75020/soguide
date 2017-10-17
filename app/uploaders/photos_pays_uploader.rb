class PhotosPaysUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
