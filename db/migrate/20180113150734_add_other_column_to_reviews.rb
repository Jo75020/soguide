class AddOtherColumnToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :fake_date, :string
  end
end
