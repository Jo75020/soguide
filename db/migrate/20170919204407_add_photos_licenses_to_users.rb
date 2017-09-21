class AddPhotosLicensesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photos_licenses, :json
  end
end
