class RevoveColumnToGuides < ActiveRecord::Migration[5.0]
  def change
    remove_column :guides, :first_name, :string
    remove_column :guides, :last_name, :string
    remove_column :guides, :email, :string
  end
end
