class Country < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  include PgSearch
  pg_search_scope :search_name, :against => [:name]

end
