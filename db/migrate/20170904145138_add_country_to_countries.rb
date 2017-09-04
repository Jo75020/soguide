class AddCountryToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :country, :string
  end
end
