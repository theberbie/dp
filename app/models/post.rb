class Post < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address_line
  after_validation :geocode
end
