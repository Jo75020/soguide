class AddFullDescriptionToCountries < ActiveRecord::Migration[5.0]
  def change
  add_column :countries, :full_description, :text
  end
end
