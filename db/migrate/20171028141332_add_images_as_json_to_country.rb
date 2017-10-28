class AddImagesAsJsonToCountry < ActiveRecord::Migration[5.0]
  def change
        add_column :countries, :images, :json, default: []
  end
end
