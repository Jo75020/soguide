class RemoveCountryFromGuides < ActiveRecord::Migration[5.0]
  def change
    remove_column :guides, :country, :string
  end
end
