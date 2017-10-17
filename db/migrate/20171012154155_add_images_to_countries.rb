class AddImagesToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :images, :text, array: true
  end
end
