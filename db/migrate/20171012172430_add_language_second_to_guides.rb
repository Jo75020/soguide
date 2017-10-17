class AddLanguageSecondToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :language_second, :string
  end
end
