class AddGuideTypeToGuides < ActiveRecord::Migration[5.0]
  def change
      add_column :guides, :guide_type_second, :string
  end
end
