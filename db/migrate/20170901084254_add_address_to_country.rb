class AddAddressToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :address, :string
  end
end
