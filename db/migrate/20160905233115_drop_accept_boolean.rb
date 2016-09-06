class DropAcceptBoolean < ActiveRecord::Migration
  def change
    remove_column :bookings, :accept, :boolean
  end
end
