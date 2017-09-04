class RemoveCountryFromCountries < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :country, :string
  end
end
