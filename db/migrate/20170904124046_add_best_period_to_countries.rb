class AddBestPeriodToCountries < ActiveRecord::Migration[5.0]
  def change
      add_column :countries, :best_period, :text
  end
end
