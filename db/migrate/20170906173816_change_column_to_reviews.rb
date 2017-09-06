class ChangeColumnToReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :checked, :string
  end
end
