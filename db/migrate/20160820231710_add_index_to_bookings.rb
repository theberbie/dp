class AddIndexToBookings < ActiveRecord::Migration
  def change
     add_column :bookings, :user_id, :integer
     add_column :bookings, :post_id, :integer
    
      add_index :bookings, [:user_id, :post_id]
      add_index :bookings , [:post_id]
  end
end
