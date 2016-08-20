class Post < ActiveRecord::Base
  belongs_to :user
  has_many :events
  geocoded_by :address_line
  after_validation :geocode
end
