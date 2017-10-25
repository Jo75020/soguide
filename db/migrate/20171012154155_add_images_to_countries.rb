class AddImagesToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :images, :string, array: true
  end
end
