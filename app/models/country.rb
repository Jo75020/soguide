class Country < ApplicationRecord
  has_attachments :photos, maximum: 10
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  include PgSearch
  pg_search_scope :search_name, :against => [:name]

end
