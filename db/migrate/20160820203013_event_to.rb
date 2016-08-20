class EventTo < ActiveRecord::Migration
  def change
    add_column :posts, :event_to, :string
  end
end
