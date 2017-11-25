class AddPartnersToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :partners, :string
  end
end
