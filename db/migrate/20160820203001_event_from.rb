class EventFrom < ActiveRecord::Migration
  def change
    add_column :posts, :event_from, :string
  end
end
