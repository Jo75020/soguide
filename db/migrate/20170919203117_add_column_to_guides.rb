class AddColumnToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :secondary_email, :string
    add_column :guides, :pays_2, :string
    add_column :guides, :facebook_profil_url, :string
    add_column :guides, :facebook_profil_page, :string
    add_column :guides, :gender, :string
  end
end
