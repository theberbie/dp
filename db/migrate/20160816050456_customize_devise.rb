class CustomizeDevise < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :phone_number, :string
    add_column :users, :username, :string
    add_column :users, :profile_photo, :string
  end
end
