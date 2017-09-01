class AddColumnToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :name, :string
    add_column :countries, :description, :string
  end
end
