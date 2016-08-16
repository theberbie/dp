class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :pet_name
      t.string  :pet_age
      t.string  :pet_breed
      t.string  :address_line
      t.string  :zipcode
      t.text    :description

      t.timestamps
    end
  end
end
