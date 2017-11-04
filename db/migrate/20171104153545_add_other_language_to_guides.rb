class AddOtherLanguageToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :language_third, :string
    add_column :guides, :language_fourth, :string
    add_column :guides, :language_fifth, :string
  end
end
