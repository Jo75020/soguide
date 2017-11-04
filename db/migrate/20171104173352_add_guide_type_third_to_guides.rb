class AddGuideTypeThirdToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :guide_type_third, :string
  end
end
