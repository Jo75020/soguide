class AddInfosToGuides < ActiveRecord::Migration[5.0]
  def change
  add_column :guides, :first_name, :string
  add_column :guides, :last_name, :string
  add_column :guides, :email, :string
  add_column :guides, :country, :string
  add_column :guides, :mobile_phone, :string
  add_column :guides, :phone, :string
  add_column :guides, :regions, :string
  add_column :guides, :guide_type, :string
  add_column :guides, :experience, :integer
  add_column :guides, :structure, :string
  add_column :guides, :structure_website, :string
  add_column :guides, :license, :string
  add_column :guides, :language, :string
  add_column :guides, :soguide_description, :text
  add_column :guides, :main_review, :text
  add_column :guides, :soguide_url, :string
  end
end
