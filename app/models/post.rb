class Post < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  
  geocoded_by :address_line
  after_validation :geocode


end
