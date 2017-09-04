class AddPaysToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :pays, :string
  end
end
