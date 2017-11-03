class RemoveColumnFromCoutries < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :images, :string
  end
end
