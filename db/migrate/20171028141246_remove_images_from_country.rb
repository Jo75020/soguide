class RemoveImagesFromCountry < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :images, :string, array: true
  end
end