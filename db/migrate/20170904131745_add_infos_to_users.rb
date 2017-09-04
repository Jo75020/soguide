class AddInfosToUsers < ActiveRecord::Migration[5.0]
  def change
  add_column :users, :first_name, :string
  add_column :users, :last_name, :string
  add_column :users, :year_of_birth, :string
  add_column :users, :postal, :string
  add_column :users, :inscription_reason, :string
  end
end
