class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      
      t.references :user, index: true
      t.references :notified_by, index: true
      t.references :bookings, index: true
      t.integer :identifier 
      t.string :notice_type
      t.boolean :read, default: false


      t.timestamps
    end
   
  end
end
