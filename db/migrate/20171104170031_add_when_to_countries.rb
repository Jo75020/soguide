class AddWhenToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :best_moment_picture, :string
  end
end
