class Country < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

def country_params
  params.require(:country).permit(:name, :description, :photo, :photo_cache, :address)
end
end
