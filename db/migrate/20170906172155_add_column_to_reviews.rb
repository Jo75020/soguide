class AddColumnToReviews < ActiveRecord::Migration[5.0]
  def change
        add_column :reviews, :checked, :string
  end
end
