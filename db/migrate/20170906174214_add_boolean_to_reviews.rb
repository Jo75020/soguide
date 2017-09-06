class AddBooleanToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :checked, :boolean, default: false
  end
end
