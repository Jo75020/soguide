class RemovePhotosPaysFromCountries < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :photos_pays, :json
  end
end
