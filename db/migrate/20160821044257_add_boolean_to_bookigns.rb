class AddBooleanToBookigns < ActiveRecord::Migration
  def change
    add_column :bookings, :accept, :boolean
  end
end
