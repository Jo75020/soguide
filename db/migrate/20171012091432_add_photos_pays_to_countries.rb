class AddPhotosPaysToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :photos_pays, :json
  end
end
